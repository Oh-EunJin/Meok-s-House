<template>
  <div id="talklist">
    <p style="color: #2c3e50">
      <b>맛집 메이트</b><br /><br />
      혼자 먹는 밥이 맛이 없을 때, 맛집을 함께 갈 맛집 메이트를 구할 수
      있습니다.<br />
      자유게시판과 공지사항 확인은 Notice 게시판을 확인해주세요.
    </p>
    <b-container class="bv-example-row mt-3">
      <b-row class="mb-1">
        <b-col class="text-right">
          <input
            type="text"
            placeholder="검색할 아파트 이름..."
            v-model="searchApt"
            class="searchbar"
          />
          <div class="search-btn-group">
            <button class="search-btn" @click="search">검색</button>
            <button class="write-btn" @click="movePage">글쓰기</button>
          </div>
        </b-col>
      </b-row>
      <b-row>
        <b-col v-if="talks.length">
          <b-table-simple hover responsive id="talk-list">
            <b-thead head-variant="light">
              <colgroup>
                <col style="width: 5%" />
                <col style="width: 20%" />
                <col style="width: 50%" />
                <col style="width: 10%" />
                <col style="width: 15%" />
              </colgroup>
              <b-tr>
                <b-th>번호</b-th>
                <b-th>작성자</b-th>
                <b-th>제목</b-th>
                <b-th>아파트 명</b-th>
                <b-th>작성일</b-th>
              </b-tr>
            </b-thead>
            <tbody>
              <list-row
                v-for="(talk, index) in talks"
                :key="index"
                :no="`${index + 1}`"
                :talk_no="talk.talk_no"
                :login_id="talk.login_id"
                :title="talk.title"
                :apt="talk.apt"
                :content="talk.content"
                :talk_time="talk.talk_time"
              />
            </tbody>
          </b-table-simple>
        </b-col>
        <b-col v-else class="text-center">게시글이 없습니다.</b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import { mapGetters, mapState, mapMutations } from "vuex";
import ListRow from "@/components/talk/include/ListRow.vue";

export default {
  name: "talklist",
  components: {
    ListRow,
  },
  data() {
    return {
      searchApt: null,
    };
  },
  computed: {
    ...mapGetters(["talks"]),
    ...mapState(["house"]),
    ...mapMutations(["SET_TALK_LIST"]),
  },
  created() {
    this.$store.dispatch("getTalks");
  },
  methods: {
    search() {
      this.$store.dispatch("getAptTalks", `/talk/apt/${this.searchApt}`);
    },
    movePage() {
      this.$router.push({ name: "talk-create" });
    },
  },
};
</script>

<style scope>
#talklist {
  min-height: 80vh;
}
.search-btn-group {
  margin-top: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;
  display: inline-block;
}
.searchbar {
  border: 1.5px solid #9a6d37;
  border-radius: 4px;
}
.search-btn-group .search-btn {
  width: 85px;
  height: 35px;
  color: #c0a27e;
  border: 1.5px solid #9a6d37;
  border-radius: 4px;
  margin-left: 0.5em;
  background: white;
}
.search-btn-group .write-btn {
  width: 85px;
  height: 35px;
  color: #c0a27e;
  border: 1.5px solid #9a6d37;
  border-radius: 4px;
  background: white;
  margin: 0.5em;
}
</style>
