<template>
  <div id="main">
    <div class="MainPage">
      <h3><b>Meok's House</b></h3>
      <br />
      <p>먹잘알들의 꿈의 동산, Meok's House 입니다.</p>
      <div class="deco"></div>
      <div class="main-container">
        <p>Meok's House는 3E의 가치를 실현합니다.</p>
        <p style="font-size: 11px">사진에 마우스 커서를 올려보세요.</p>
        <br />
        <div class="part">
          <div class="sub-part1">
            <div class="part1">
              <strong class="tit1">Every</strong>
              <p>
                누구나 이용하기 쉽도록<br />
                사이트가 구성되어 <br /><br />모든 고객들이 <br />이용할 수
                있습니다.
              </p>
            </div>
          </div>
          <div class="sub-part2">
            <div class="part2">
              <strong class="tit2">Enjoy</strong>
              <p>
                내가 구하고자 하는 <br />아파트 근처의 맛집 정보까지
                <br />제공하여<br /><br />고객들에게 즐거움을<br />
                선사합니다.
              </p>
            </div>
          </div>
          <div class="sub-part3">
            <div class="part3">
              <strong class="tit3">Express</strong>
              <p>
                맛집 메이트를 구하며<br /><br />
                소통과 대화가 주는 즐거움을 느낄 수 있습니다.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <about-page />
  </div>
</template>

<script>
import AboutPage from "../components/layout/AboutPage.vue";
export default {
  components: { AboutPage },
};
</script>

<style>
#main {
  padding: 0 30px 30px;
}
.main-container {
  padding: 50px 0;
  background-color: #f2f2f2;
}
.tit1 {
  color: white;
  padding: 10px;
  border-bottom: 2px solid white;
  font-size: 30px;
}
.tit2 {
  color: white;
  padding: 10px;
  border-bottom: 2px solid white;
  font-size: 30px;
}
.tit3 {
  color: white;
  padding: 10px;
  border-bottom: 2px solid white;
  font-size: 30px;
}
.part {
  display: flex;
  width: 90%;
  margin: 0 auto;
  border-radius: 5px;
}
.part img {
  transition: all 0.2s;
  -webkit-transition: all 0.2s;
  -moz-transition: all 0.2s;
  filter: grayscale(0%);
}
.sub-part1 {
  width: 33.3%;
  height: 20em;
  overflow: hidden;
  background-image: url("../assets/kid.jpg");
  background-size: 130%;
  background-position-x: -5em;
  background-position-y: -3em;
}
.sub-part2 {
  width: 33.3%;
  height: 20em;
  overflow: hidden;
  background-image: url("../assets/pasta.jpg");
  background-size: 110%;
  background-position-x: -2em;
}
.sub-part3 {
  width: 33.3%;
  height: 20em;
  overflow: hidden;
  background-image: url("../assets/restaurant.jpg");
  background-size: 110%;
  background-position-x: -2em;
}
.part1,
.part2,
.part3 {
  height: 100%;
  padding: 3em 0;
  background-color: black;
  opacity: 0;
  transition: opacity 1s;
}
.part1:hover,
.part2:hover,
.part3:hover {
  opacity: 0.8;
}
.part1 p,
.part2 p,
.part3 p {
  color: white;
  padding: 3em;
}
</style>
