<template>
  <div v-show="isShow" class="comment">
    <div class="head">
      {{ comment.login_id }} &nbsp; ({{ comment.comment_time }})
    </div>
    <div class="content" v-html="enterToBr(comment.comment)"></div>
    <!-- 로그인 기능 구현 후 로그인한 자신의 글에만 보이게 한다. -->
    <div class="comment-btn-group" v-if="this.isUpdate === true">
      <label class="btn" @click="modifyCommentView">수정</label>
      <label class="btn" @click="deleteComment">삭제</label>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";
import { mapState } from "vuex";

export default {
  name: "comment",
  data() {
    return {
      isShow: true,
      isUpdate: false,
    };
  },
  props: {
    comment: Object,
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  created() {
    console.log(this.comment.login_id);
    if (this.comment.login_id === this.userInfo.login_id) {
      this.isUpdate = true;
    } else {
      this.isUpdate = false;
    }
  },
  updated() {
    console.log(this.comment.login_id);
    if (this.comment.login_id === this.userInfo.login_id) {
      this.isUpdate = true;
    } else {
      this.isUpdate = false;
    }
  },
  methods: {
    modifyCommentView() {
      this.$emit("modify-comment", {
        comment_no: this.comment.comment_no,
        comment: this.comment.comment,
        talk_no: this.comment.talk_no,
      });
    },
    deleteComment() {
      if (confirm("정말로 삭제하시겠습니까?")) {
        http.delete(`/comment/${this.comment.comment_no}`).then(({ data }) => {
          let msg = "삭제 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "삭제가 완료되었습니다.";
          }
          alert(msg);

          this.$store.dispatch(
            "getComments",
            `/comment/${this.comment.talk_no}`
          );
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
.comment {
  text-align: left;
  border-radius: 5px;
  border: 1px solid #c0a27e;
  background-color: #f2f2f2;
  padding: 10px 20px;
  margin: 1em;
}
.head {
  font-weight: bold;
  margin-bottom: 5px;
  padding: 5px;
}
.content {
  padding: 5px;
}
.comment-btn-group {
  display: flex;
  justify-content: end;
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
