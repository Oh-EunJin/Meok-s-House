<template>
  <div>
    <view-detail />
    <comment-write :talk_no="this.talk_no" />
    <comment-write
      v-if="isModifyShow && this.modifyComment != null"
      :modifyComment="this.modifyComment"
      @modify-comment-cancel="onModifyCommentCancel"
    />
    <comment
      v-for="(comment, index) in comments"
      :key="index"
      :comment="comment"
      @modify-comment="onModifyComment"
    />
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import ViewDetail from "@/components/talk/include/ViewDetail.vue";
import CommentWrite from "@/components/talk/include/comment/CommentWrite.vue";
import Comment from "@/components/talk/include/comment/Comment.vue";

export default {
  name: "talkview",
  data() {
    return {
      talk_no: "",
      isModifyShow: false,
      modifyComment: Object,
    };
  },
  computed: {
    ...mapGetters(["comments"]),
  },
  components: {
    ViewDetail,
    CommentWrite,
    Comment,
  },
  created() {
    this.talk_no = this.$route.query.talk_no;

    this.$store.dispatch("getTalk", `/talk/${this.talk_no}`);

    this.$store.dispatch("getComments", `/comment/${this.talk_no}`);
  },
  methods: {
    onModifyComment(comment) {
      this.modifyComment = comment;
      this.isModifyShow = true;
    },
    onModifyCommentCancel(isShow) {
      this.isModifyShow = isShow;
    },
  },
};
</script>
