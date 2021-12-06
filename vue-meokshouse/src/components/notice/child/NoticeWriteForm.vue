<template>
  <div id="formpage">
    <p style="color: #2c3e50" v-if="this.type === 'register'">
      <b>먹잘알들만의 놀이터</b><br /><br />
      Notice 글을 작성합니다. <br />
      맛집메이트 구하기는 Talk 게시판을 이용해주세요.
    </p>
    <p style="color: #2c3e50" v-else>
      <b>먹잘알들만의 놀이터</b><br /><br />
      Notice 글을 수정합니다. <br />
      맛집메이트 구하기는 Talk 게시판을 이용해주세요.
    </p>
    <b-form @submit="onSubmit" @reset="onReset">
      <b-container>
        <table class="view-table">
          <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
          </colgroup>
          <b-tr class="view-table-content">
            <b-th>작성자</b-th>
            <b-td
              ><b-form-input
                ref="login_id"
                v-model="login_id"
                readonly
              ></b-form-input
            ></b-td>
          </b-tr>
          <b-tr class="view-table-content">
            <b-th>제목</b-th>
            <b-td
              ><b-form-input ref="subject" v-model="subject"></b-form-input
            ></b-td>
          </b-tr>
          <b-tr class="view-table-content">
            <b-th>내용</b-th>
            <b-td>
              <b-form-textarea
                class="view-table-textarea"
                v-model="content"
                ref="content"
                placeholder="내용 입력..."
                rows="10"
                max-rows="15"
              ></b-form-textarea
            ></b-td>
          </b-tr>
        </table>
      </b-container>
      <div style="padding-top: 15px" class="view-btn-group">
        <button type="submit" class="btn" v-if="this.type === 'register'">
          글작성
        </button>
        <button type="submit" class="btn" v-else>글수정</button>
        <button type="reset" class="btn">취소</button>
      </div>
    </b-form>
  </div>
</template>

<script>
import http from "@/util/http-common";
import { mapState } from "vuex";

export default {
  name: "NoticeWriteForm",
  data() {
    return {
      articleno: 0,
      login_id: "",
      subject: "",
      content: "",

      isLoginid: false,
    };
  },
  props: {
    type: { type: String },
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  created() {
    if (this.userInfo === null) {
      alert("로그인을 해주세요.");
      this.$router.push({ name: "Login" });
    }

    if (this.type === "modify") {
      http.get(`/notice/${this.$route.params.articleno}`).then(({ data }) => {
        this.login_id = data.login_id;
        this.subject = data.subject;
        this.content = data.content;
      });
      this.isLoginid = true;
    } else {
      this.login_id = this.userInfo.login_id;
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      !this.login_id &&
        ((msg = "작성자 입력해주세요"),
        (err = false),
        this.$refs.login_id.focus());
      err &&
        !this.subject &&
        ((msg = "제목 입력해주세요"),
        (err = false),
        this.$refs.subject.focus());
      err &&
        !this.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registNotice() : this.modifyNotice();
    },
    onReset(event) {
      event.preventDefault();
      this.articleno = 0;
      this.subject = "";
      this.content = "";
      this.$router.push({ name: "NoticeList" });
    },
    registNotice() {
      http
        .post(`/notice/`, {
          login_id: this.login_id,
          subject: this.subject,
          content: this.content,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        })
        .catch(({ error }) => {
          console.log(error);
        });
    },
    modifyNotice() {
      http
        .put(`/notice/${this.$route.params.articleno}`, {
          articleNo: this.$route.params.articleno,
          subject: this.subject,
          content: this.content,
        })
        .then(({ data }) => {
          console.log(this.$route.params.articleno);
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    moveList() {
      this.$router.push({ name: "NoticeList" });
    },
  },
};
</script>

<style scoped>
.form {
  width: 100%;
}
.container {
  width: 80%;
  border-top: 2px solid #d6ae7b;
  border-bottom: 2px solid #d6ae7b;
  min-height: 40vh;
  margin-top: 3%;
}
.view-table {
  width: 90%;
  height: 100%;
  margin: 1em;
  border-spacing: 10px;
}
.view-table-content {
  padding: 10px;
}
.view-table td {
  border: none;
  padding: 1em;
}
.view-table th {
  border-right: 1px solid #d6ae7b;
}
.view-table-textarea {
  min-height: 200px;
}
.view-btn-group {
  padding: 1em;
  margin: 0;
}
.btn {
  width: 95px;
  height: 35px;
  color: white;
  border: 0;
  border-radius: 4px;
  background: #d6ae7b;
  margin: 1em;
}
</style>
