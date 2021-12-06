<template>
  <div>
    <div class="btn">
      <button @click="search()">
        <div><img src="../../assets/aptmarker.png" alt="aptmarker.png" /></div>
        <p class="text">아파트 정보 보기</p>
      </button>
    </div>
    <div id="map"></div>
  </div>
</template>

<script>
import EventBus from "/EventBus.js";
import http from "@/util/http-common";
import { mapState, mapActions, mapMutations } from "vuex";

export default {
  name: "KakaoMap",
  data() {
    return {
      map: null,
      markers: null,
    };
  },
  computed: {
    ...mapState(["sigudongs"]),
  },
  created() {
    this.CLEAR_SIGUDONG_LIST();
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=3bd69fea3826d3a9b19635a2c13e9eff&libraries=services";
      document.head.appendChild(script);
    }
  },
  methods: {
    ...mapActions(["getHouseList"]),
    ...mapMutations(["CLEAR_SIGUDONG_LIST"]),
    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 6,
      };
      this.map = new kakao.maps.Map(container, options);

      EventBus.$on("pushAddress", (payload) => {
        this.address = payload;
        console.log("+++++++");
        console.log(this.address);
      });
    },
    search() {
      console.log(this.sigudongs);
      const dd = this.sigudongs;

      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 6,
      };
      var map = new kakao.maps.Map(container, options);

      for (var i = 0; i < this.sigudongs.length; i++) {
        var j = 0;
        var param = this.sigudongs[i].value;

        http
          .get(`/map/sigundong?sgd=${param}`)
          .then(({ data }) => {
            var address =
              data[0].sidoName +
              " " +
              data[0].gugunName +
              " " +
              data[0].dongName +
              " " +
              dd[j].jibun;
            j++;

            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(address, function (result, status) {
              if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                var marker = new kakao.maps.Marker({
                  position: coords,
                });
                marker.setMap(map);
                var bounds = new kakao.maps.LatLngBounds();
                bounds.extend(coords);

                map.setCenter(coords);
              }
            });
          })
          .catch((error) => {
            console.log(error);
          });
      }
      this.CLEAR_SIGUDONG_LIST();
    },
  },
};
</script>

<style>
#map {
  width: 550px;
  height: 600px;
}

.btn {
  margin: 10px 0px;
}

.search {
  border-radius: 5px;
  margin-right: 4px;
}
.btn button {
  margin: 0 3px;
  height: 50px;
  width: 200px;
  border-radius: 10px;
  border: 2px solid #d6ae7b;
  background-color: #f2f2f2;
}
.btn button > div {
  width: 40px;
  height: 50px;
  display: inline-block;
}
.btn button > div > img {
  width: 100%;
  height: 40px;
}
</style>
