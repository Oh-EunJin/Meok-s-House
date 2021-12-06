<template>
  <div id="viewpage">
    <p style="color: #2c3e50">
      <b>맛집 메이트</b><br /><br />
      맛집을 함께 갈 맛집 메이트를 선택하셨나요?<br />
      댓글로 글 작성자와 소통해보세요!
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
              v-model="talk.login_id"
              readonly
              >{{ talk.login_id }}</b-form-input
            ></b-td
          >
        </b-tr>
        <b-tr class="view-table-content">
          <b-th>아파트명</b-th>
          <b-td
            ><b-form-input class="view-content" v-model="talk.apt" readonly>{{
              talk.apt
            }}</b-form-input></b-td
          >
        </b-tr>
        <b-tr class="view-table-content">
          <b-th>제목</b-th>
          <b-td
            ><b-form-input class="view-content" v-model="talk.title" readonly>{{
              talk.title
            }}</b-form-input></b-td
          >
        </b-tr>
        <b-tr class="view-table-content">
          <b-th>내용</b-th>
          <b-td>
            <b-form-textarea
              class="view-content"
              v-model="talk.content"
              rows="10"
              max-rows="15"
              readonly
              >{{ talk.content }}</b-form-textarea
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
      <router-link :to="`/talk/modify/${talk.talk_no}`" class="btn"
        >수정</router-link
      >
      <a href="#" class="btn" @click="deleteTalk">삭제</a>
      <router-link to="/talk" class="btn">목록</router-link>
    </div>
    <div style="padding-top: 15px" class="view-btn-group" v-else>
      <router-link to="/talk" class="btn">목록</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import http from "@/util/http-common";

export default {
  name: "viewdetail",
  data() {
    return {
      isUpdate: false,
    };
  },
  computed: {
    ...mapGetters(["talk"]),
    ...mapState(["userInfo"]),
  },
  updated() {
    if (this.talk.login_id === this.userInfo.login_id) {
      this.isUpdate = true;
    } else {
      this.isUpdate = false;
    }
  },
  methods: {
    deleteTalk() {
      if (confirm("정말로 삭제하시겠습니까?")) {
        http.delete(`/talk/${this.talk.talk_no}`).then(({ data }) => {
          let msg = "삭제 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "삭제가 완료되었습니다.";
          }
          alert(msg);
          this.$router.push("/talk");
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
