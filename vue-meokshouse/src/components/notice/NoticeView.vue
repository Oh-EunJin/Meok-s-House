<template>
  <div id="viewpage">
    <p style="color: #2c3e50">
      <b>먹잘알들만의 놀이터</b><br /><br />
      Notice 글 상세정보를 확인합니다. <br />
      맛집메이트 구하기는 Talk 게시판을 이용해주세요.
    </p>
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
              class="view-content"
              v-model="notice.login_id"
              readonly
              >{{ notice.login_id }}</b-form-input
            ></b-td
          >
        </b-tr>
        <b-tr class="view-table-content">
          <b-th>제목</b-th>
          <b-td
            ><b-form-input
              class="view-content"
              v-model="notice.subject"
              readonly
              >{{ notice.subject }}</b-form-input
            ></b-td
          >
        </b-tr>
        <b-tr class="view-table-content">
          <b-th>내용</b-th>
          <b-td>
            <b-form-textarea
              class="view-content"
              v-model="notice.content"
              rows="10"
              max-rows="15"
              readonly
              >{{ notice.content }}</b-form-textarea
            ></b-td
          >
        </b-tr>
      </table>
    </b-container>
    <div
      style="padding-top: 15px"
      class="view-btn-group"
      v-if="isUpdate === true"
    >
      <router-link
        :to="`/notice/modify/${this.$route.params.articleno}`"
        class="btn"
        >수정</router-link
      >
      <a href="#" class="btn" @click="deleteNotice">삭제</a>
      <router-link to="/notice" class="btn">목록</router-link>
    </div>
    <div style="padding-top: 15px" class="view-btn-group" v-else>
      <router-link to="/notice" class="btn">목록</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import http from "@/util/http-common";

export default {
  name: "NoticeView",
  data() {
    return {
      articleno: 0,
      login_id: null,
      isUpdate: false,
    };
  },
  computed: {
    ...mapGetters(["notice"]),
    ...mapState(["userInfo"]),
  },
  created() {
    this.articleno = this.$route.params.articleno;
    this.$store.dispatch("getNotice", `/notice/${this.articleno}`);
  },
  updated() {
    if (this.notice.login_id === this.userInfo.login_id) {
      this.isUpdate = true;
    } else {
      this.isUpdate = false;
    }
  },
  methods: {
    deleteNotice() {
      if (confirm("정말로 삭제하시겠습니까?")) {
        http
          .delete(`/notice/${this.$route.params.articleno}`)
          .then(({ data }) => {
            let msg = "삭제 처리시 문제가 발생했습니다.";
            if (data === "success") {
              msg = "삭제가 완료되었습니다.";
            }
            alert(msg);
            this.$router.push("/notice");
          });
      }
    },
    enterToBr(str) {
      if (str) return str.replace(/(?:\r\n|\r|\n)/g, "<br />");
    },
  },
};
</script>

<style scoped>
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
.view-table .view-content:focus {
  outline: none;
}
.view-content:read-only {
  background-color: white;
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
