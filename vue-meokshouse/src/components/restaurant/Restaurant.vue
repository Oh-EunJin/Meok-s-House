<template>
  <b-container class="bv-example-row mt-3 text-center">
    <h3><b-icon icon="house-fill"></b-icon> 맛집 정보</h3>
    <div class="deco"></div>
    <div>
      <p style="color: #2c3e50">
        먹잘알들만의 꿈의 집<br />
        각 지역의 아파트 정보와 주변 맛집 리스트들을 안내해드립니다.<br/>
        맛집명 클릭 시에는 맛집에 대한 정보가 나옵니다.
      </p>
    </div>
    <b-row>
      <b-col cols="12" class="mt-3">
        <house-detail />
      </b-col>
    </b-row>
    <hr />
    <b-row>
      <b-col cols="6" align="left">
        <restaurant-list />
      </b-col>
      <b-col cols="6">
        <kakao-map />
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import RestaurantList from "@/components/restaurant/RestaurantList.vue";
import KakaoMap from "@/components/restaurant/KakaoMap.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";

export default {
  name: "Restaurant",
  components: {
    RestaurantList,
    KakaoMap,
    HouseDetail,
  },
};
</script>

<style scoped>
.container {
  min-height: 200px;
}
</style>
