<template>
  <div id="formpage">
    <p style="color: #2c3e50" v-if="type == 'create'">
      <b>맛집 메이트</b><br /><br />
      맛집 메이트를 구해 함께 맛있는 음식을 드세요!<br />
      자유게시판과 공지사항 확인은 Notice 게시판을 확인해주세요.
    </p>
    <p style="color: #2c3e50" v-else>
      <b>맛집 메이트</b><br /><br />
      Talk 게시판 글을 수정합니다.<br />
      자유게시판과 공지사항 확인은 Notice 게시판을 확인해주세요.
    </p>
    <b-form>
      <b-container>
        <table class="view-table">
          <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
          </colgroup>
          <b-tr class="view-table-content">
            <b-th>작성자</b-th>
            <b-td>
              <b-form-input
                type="text"
                id="login_id"
                name="login_id"
                ref="login_id"
                v-if="type === 'create'"
                v-model="login_id"
                required
                readonly
              ></b-form-input>
              <b-form-input
                type="text"
                id="login_id"
                name="login_id"
                ref="login_id"
                v-else
                v-model="login_id"
                readonly
              ></b-form-input>
            </b-td>
          </b-tr>
          <b-tr class="view-table-content">
            <b-th>아파트명</b-th>
            <b-td>
              <b-form-input
                type="text"
                id="apt"
                name="apt"
                ref="apt"
                v-model="apt"
                required
                readonly
              ></b-form-input
            ></b-td>
          </b-tr>
          <b-tr class="view-table-content">
            <b-th>제목</b-th>
            <b-td>
              <b-form-input
                type="text"
                id="title"
                name="title"
                ref="title"
                v-model="title"
                required
                placeholder="제목을 입력해주세요."
              ></b-form-input
            ></b-td>
          </b-tr>
          <b-tr class="view-table-content">
            <b-th>내용</b-th>
            <b-td>
              <b-form-textarea
                class="view-table-textarea"
                id="content"
                name="content"
                v-model="content"
                ref="content"
                rows="10"
                max-rows="15"
                placeholder="내용을 입력해주세요."
              ></b-form-textarea
            ></b-td>
          </b-tr>
        </table>
      </b-container>
      <div style="padding-top: 15px" class="view-btn-group">
        <b-button class="btn" v-if="type == 'create'" @click="checkValue">
          글작성
        </b-button>
        <b-button class="btn" v-else @click="checkValue">글수정</b-button>
        <b-button class="btn" @click="moveList">목록</b-button>
      </div>
    </b-form>
  </div>
</template>

<script>
import http from "@/util/http-common";
import { mapState } from "vuex";

export default {
  name: "writeform",
  props: {
    type: { type: String },
  },
  data() {
    return {
      login_id: "",
      talk_no: "",
      title: "",
      content: "",
      apt: "",
    };
  },
  computed: {
    ...mapState(["userInfo", "house"]),
  },
  created() {
    if (this.userInfo === null) {
      alert("로그인을 해주세요.");
      this.$router.push({ name: "Login" });
    }

    if (this.type === "modify") {
      http.get(`/talk/${this.$route.params.talk_no}`).then(({ data }) => {
        this.login_id = data.login_id;
        this.title = data.title;
        this.content = data.content;
        this.apt = data.apt;
      });
    } else {
      this.login_id = this.userInfo.login_id;
      this.apt = this.house.아파트;
    }
  },
  methods: {
    checkValue() {
      let err = true;
      let msg = "";
      !this.login_id &&
        ((msg = "작성자 입력해주세요"),
        (err = false),
        this.$refs.login_id.focus());
      err &&
        !this.title &&
        ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());
      err &&
        !this.apt &&
        ((msg = "아파트명 입력해주세요"),
        (err = false),
        this.$refs.apt.focus());

      if (!err) alert(msg);
      else this.type == "create" ? this.registTalk() : this.modifyTalk();
    },
    registTalk() {
      http
        .post("/talk/", {
          login_id: this.login_id,
          title: this.title,
          content: this.content,
          apt: this.apt,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    modifyTalk() {
      http
        .put(`/talk/${this.$route.params.talk_no}`, {
          talk_no: this.$route.params.talk_no,
          title: this.title,
          content: this.content,
          apt: this.apt,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          // console.log(this.title);
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    moveList() {
      this.$router.push("/talk");
    },
  },
};
</script>

<style scoped>
.form {
  width: 100%;
}
.container {
  width: 100%;
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
