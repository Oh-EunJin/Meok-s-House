<template>
  <b-row class="mt-4 mb-4 text-center">
    <b-col class="sm-3">
      <b-form-select
        v-model="sidoCode"
        :options="sidos"
        @change="gugunList"
      ></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select
        v-model="gugunCode"
        :options="guguns"
        @change="searchApt"
      ></b-form-select>
    </b-col>
  </b-row>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

export default {
  name: "HouseSearchBar",
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
    };
  },
  computed: {
    ...mapState(["sidos", "guguns", "houses", "sigudongs"]),
  },
  created() {
    this.CLEAR_SIDO_LIST();
    this.CLEAR_HOUSE_LIST();
    this.CLEAR_SIGUDONG_LIST();
    this.CLEAR_RESTAURANT_LIST();
    this.getSido();
  },
  methods: {
    ...mapActions(["getSido", "getGugun", "getHouseList"]),
    ...mapMutations([
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "CLEAR_HOUSE_LIST",
      "CLEAR_SIGUDONG_LIST",
      "CLEAR_RESTAURANT_LIST",
    ]),
    gugunList() {
      this.CLEAR_GUGUN_LIST();

      this.gugunCode = null;
      if (this.sidoCode) this.getGugun(this.sidoCode);
    },
    searchApt() {
      if (this.gugunCode) {
        this.getHouseList(this.gugunCode);
      }
    },
  },
};
</script>

<style></style>
