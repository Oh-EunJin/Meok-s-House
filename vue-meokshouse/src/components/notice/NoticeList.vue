<template>
  <b-container class="bv-example-row mt-3">
    <p style="color: #2c3e50">
      <b>먹잘알들만의 놀이터</b><br /><br />
      공지사항을 확인하거나 자유롭게 이야기할 수 있는 공간입니다. <br />
      맛집메이트 구하기는 Talk 게시판을 이용해주세요.
    </p>
    <b-row class="mb-1">
      <b-col class="text-right">
        <button class="btn" @click="moveWrite()">글쓰기</button>
      </b-col>
    </b-row>
    <b-row>
      <b-col v-if="notices.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="light">
            <colgroup>
              <col style="width: 5%" />
              <col style="width: 60%" />
              <col style="width: 10%" />
              <col style="width: 15%" />
              <col style="width: 10%" />
            </colgroup>
            <b-tr>
              <b-th>글번호</b-th>
              <b-th>제목</b-th>
              <b-th>작성자</b-th>
              <b-th>작성일</b-th>
              <b-th>조회수</b-th>
            </b-tr>
          </b-thead>
          <tbody>
            <notice-list-item
              v-for="(notice, index) in notices"
              :key="index"
              :no="`${index + 1}`"
              :articleno="notice.articleNo"
              :login_id="notice.login_id"
              :subject="notice.subject"
              :content="notice.content"
              :hits="notice.hits"
              :regtime="notice.regTime"
            />
          </tbody>
        </b-table-simple>
      </b-col>
      <b-col v-else class="text-center">등록된 글이 없습니다.</b-col>
    </b-row>
  </b-container>
</template>

<script>
import NoticeListItem from "@/components/notice/child/NoticeListItem.vue";
import { mapGetters } from "vuex";

export default {
  name: "NoticeList",
  components: {
    NoticeListItem,
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters(["notices"]),
  },
  created() {
    this.$store.dispatch("getNoticeList");
  },
  methods: {
    moveWrite() {
      this.$router.push({ name: "NoticeWrite" });
    },
  },
};
</script>

<style scoped>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
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
