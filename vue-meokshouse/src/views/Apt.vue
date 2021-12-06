<template>
  <b-container class="bv-example-row mt-3 text-center">
    <h3><b-icon icon="house-fill"></b-icon> 아파트 정보</h3>
    <div class="deco"></div>
    <div>
      <p style="color: #2c3e50">
        <b>먹잘알들만의 꿈의 집</b><br /><br />
        각 지역의 아파트 정보와 주변 맛집 리스트들을 안내해드립니다.<br />
      </p>
    </div>
    <b-row>
      <b-col>
        <house-search-bar></house-search-bar>
      </b-col>
    </b-row>
    <b-row>
      <b-col cols="6" align="left">
        <house-list />
      </b-col>
      <b-col cols="6">
        <kakao-map />
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import HouseList from "@/components/house/HouseList.vue";
import KakaoMap from "@/components/house/KakaoMap.vue";

export default {
  name: "House",
  components: {
    HouseSearchBar,
    HouseList,
    KakaoMap,
  },
};
</script>
<style scoped>
.deco {
  border-bottom: 2px solid #2c3e50;
  height: 30px;
  width: 100px;
  display: inline-block;
  margin-bottom: 30px;
}
</style>
