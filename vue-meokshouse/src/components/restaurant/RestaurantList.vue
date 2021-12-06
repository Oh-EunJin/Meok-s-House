<template>
  <div>
    <div class="btn">
      <button @click="movePage" class="find">
        <p class="text">맛집 메이트 찾기</p>
      </button>
    </div>
    <b-container
      v-if="restaurants && restaurants.length != 0"
      class="bv-example-row"
    >
      <restaurant-list-row
        v-for="(restaurant, index) in restaurants"
        :key="index"
        :restaurant="restaurant"
      />
    </b-container>
    <b-container v-else class="bv-example-row">
      <b-row>
        <b-col
          ><b-alert class="list" show>맛집 목록이 없습니다.</b-alert></b-col
        >
      </b-row>
    </b-container>
  </div>
</template>

<script>
import RestaurantListRow from "@/components/restaurant/RestaurantListRow.vue";
import { mapState, mapActions, mapMutations } from "vuex";
import EventBus from "/EventBus.js";

export default {
  name: "RestaurantList",
  components: {
    RestaurantListRow,
  },
  data() {
    return {};
  },
  created() {
    EventBus.$on("pushAddress", (payload) => {
      this.address = payload;

      this.getRestaurantList(this.address);
    });
  },
  computed: {
    ...mapState(["restaurants"]),
  },
  methods: {
    ...mapActions(["getRestaurantList"]),
    ...mapMutations(["CLEAR_RESTAURANT_LIST"]),
    movePage() {
      this.$router.push({ name: "Talk" });
    },
  },
};
</script>

<style scoped>
.list {
  margin-top: 2em;
  background-color: #f2f2f2;
  border-color: #f2f2f2;
  color: #2c3e50;
}
.container {
  border: 1px solid #d6ae7b;
}
.btn {
  width: 100%;
}
.btn .text {
  line-height: 50px;
}
</style>
