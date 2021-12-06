<template>
  <b-container class="bv-example-row">
    <div class="aptNameBack">
      <b-row>
        <b-col
          ><h3 id="aptName">{{ house.아파트 }}</h3></b-col>
      </b-row>
      <b-row>
        <b-col>
          <b-alert show
            >일련번호 : {{ house.일련번호 }}</b-alert
          >
        </b-col>
        <b-col>
          <b-alert show>법정동 : {{ house.법정동 }}</b-alert>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <b-alert show >층수 : {{ house.층 }}층</b-alert>
        </b-col>
        <b-col>
          <b-alert show
            >거래금액 :
            {{
              (parseInt(house.거래금액.replace(",", "")) * 10000) | price
            }}원</b-alert
          >
        </b-col>
      </b-row>
    </div>
  </b-container>
</template>

<script>
import { mapState } from "vuex";
import EventBus from "/EventBus.js";

export default {
  name: "HouseDetail",
  computed: {
    ...mapState(["house"]),
  },
  filters: {
    price(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },
  created() {
    var houseApt = this.house.아파트;
    EventBus.$emit("houseAddress", houseApt);
  },
};
</script>

<style>
.aptNameBack {
  background-color: #f2f2f2;
  padding: 15px;
  border-radius: 10px;
}
#aptName{
  color: #2c3e50;
}
.aptNameBack div .alert {
  background-color: #DBC9B5;
  border-color: #DBC9B5;
}
</style>
