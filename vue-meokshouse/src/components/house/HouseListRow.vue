<template>
  <b-row
    class="mt-3 mb-3"
    @click="selectHouse"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <b-col cols="2" class="text-center align-self-center">
      <b-img thumbnail :src="require('@/assets/apt.png')" alt="Image 1"></b-img>
    </b-col>
    <router-link
      id="aptItem"
      cols="6"
      class="align-self-center"
      :to="{ name: 'Restaurant' }"
      >[{{ house.일련번호 }}] &nbsp;&nbsp; {{ house.아파트 }}
    </router-link>
  </b-row>
</template>

<script>
import { mapActions } from "vuex";
import http from "@/util/http-common";
import EventBus from "/EventBus.js";

export default {
  name: "HouseListRow",
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    house: Object,
  },
  methods: {
    ...mapActions(["detailHouse"]),
    colorChange(flag) {
      this.isColor = flag;
    },
    selectHouse() {
      this.detailHouse(this.house);

      // 특정 아파트 선택 시
      const sigundong =
        this.house.법정동시군구코드 + "" + this.house.법정동읍면동코드;
      http
        .get(`/map/sigundong?sgd=${sigundong}`)
        .then(({ data }) => {
          const address =
            data[0].sidoName +
            " " +
            data[0].gugunName +
            " " +
            data[0].dongName +
            " " +
            this.house.지번;
          console.log(address);

          EventBus.$emit(
            "pushAddress",
            data[0].sidoName + " " + data[0].gugunName
          );
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped>
.apt {
  width: 50px;
}
.mouse-over-bgcolor {
  background-color: lightblue;
}
#aptItem {
  text-decoration: none;
  color: #2c3e50;
}
</style>
