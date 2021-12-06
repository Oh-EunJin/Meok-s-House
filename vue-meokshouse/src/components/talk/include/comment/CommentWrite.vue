<template>
  <div class="regist">
    <div v-if="this.modifyComment != null" class="regist_form">
      <textarea
        id="answer"
        name="answer"
        v-model="modifyComment.comment"
        cols="35"
        rows="2"
      ></textarea>
      <div class="view-btn-group">
        <button class="btn" @click="updateComment">수정</button>
        <button class="btn" @click="updateCommentCancel">취소</button>
      </div>
    </div>
    <div v-else class="regist_form">
      <textarea
        id="comment"
        name="comment"
        v-model="comment"
        cols="15"
        rows="2"
      ></textarea>
      <div class="view-btn-group">
        <button class="btn" @click="registComment">등록</button>
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";
import { mapState } from "vuex";

export default {
  name: "commentwrite",
  data() {
    return {
      login_id: "",
      comment: "",
    };
  },
  props: {
    talk_no: { type: String },
    modifyComment: { type: Object },
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  created() {
    if (this.userInfo === null) {
      alert("로그인을 해주세요.");
      this.$router.push({ name: "Login" });
    }

    this.login_id = this.userInfo.login_id;
  },
  methods: {
    registComment() {
      http
        .post("/comment/", {
          login_id: this.login_id,
          comment: this.comment,
          talk_no: this.talk_no,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.$router.go();

          this.comment = "";

          this.$store.dispatch("getComments", `/comment/${this.talk_no}`);
        });
    },
    updateComment() {
      http
        .put(`/comment`, {
          comment_no: this.modifyComment.comment_no,
          comment: this.modifyComment.comment,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);

          this.$store.dispatch(
            "getComments",
            `/comment/${this.modifyComment.talk_no}`
          );
          this.$emit("modify-comment-cancel", false);
        });
    },
    updateCommentCancel() {
      this.$emit("modify-comment-cancel", false);
    },
  },
};
</script>

<style scoped>
.regist {
  padding: 10px;
}
.regist_form {
  text-align: left;
  border-radius: 5px;
  background-color: #e9d2b7;
  padding: 20px;
  display: flex;
  align-items: center;
}

textarea {
  width: 90%;
  padding: 10px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  color: #787878;
  font-size: large;
}

.view-btn-group {
  width: 90px;
  margin-left: 1em;
}
.btn {
  background: white;
  border: 1px solid #c0a27e;
  width: 100%;
  height: 35px;
  font-size: 13px;
  color: #c0a27e;
  border-radius: 4px;
}
</style>
