<template>
  <div>
    <div class="btn">
      <button @click="search()">
        <div>
          <img src="../../assets/foodmarker.png" alt="foodmarker.png" />
        </div>
        <p class="text">맛집 보기</p>
      </button>
    </div>
    <div id="map"></div>
  </div>
</template>

<script>
import EventBus from "/EventBus.js";
import { mapState, mapActions } from "vuex";

export default {
  name: "KakaoMap",
  data() {
    return {
      map: null,
      markers: null,
    };
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=eae654bdb2d443688750665e20ffa8af&libraries=services";
      document.head.appendChild(script);
    }
  },
  computed: {
    ...mapState(["restaurants"]),
  },
  methods: {
    ...mapActions(["getRestaurantList"]),

    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 6,
      };
      this.map = new kakao.maps.Map(container, options);
    },
    search() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 7,
      };
      var map = new kakao.maps.Map(container, options);

      EventBus.$on("houseAddress", (payload) => {
        this.aptName = payload;
      });

      this.restaurants.forEach(function (addr) {
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(addr.load_addr, function (result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            var marker = new kakao.maps.Marker({
              position: coords,
            });
            marker.setMap(map);

            var content = `
                <div class="customoverlay">
                  <a href="https://map.kakao.com/link/map/${addr.entrp_nm},${result[0].y},${result[0].x}" target="_blank">
                    <span class="title">${addr.entrp_nm}</span>
                  </a>
                </div>
            `;

            var overlay = new kakao.maps.CustomOverlay({
              content: content,
              map: map,
              position: marker.getPosition(),
            });

            kakao.maps.event.addListener(marker, "click", function () {
              overlay.setMap(map);
            });

            var bounds = new kakao.maps.LatLngBounds();
            bounds.extend(coords);

            map.setCenter(coords);
          }
        });
      });
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
.btn button:hover > div > img {
  animation-name: test;
  animation-duration: 4s;
  animation-iteration-count: infinite;
}
@keyframes test {
  0% {
    margin-top: 3px;
  }
  25% {
    margin-top: -3px;
  }
  75% {
    margin-top: 3px;
  }
  100% {
    margin-top: -3px;
  }
}
.btn button > .text {
  display: inline-block;
}
.info-title {
  display: block;
  background: #50627f;
  color: #fff;
  text-align: center;
  height: 24px;
  line-height: 22px;
  border-radius: 4px;
  padding: 0px 10px;
}

.customoverlay {
  position: relative;
  bottom: 85px;
  border-radius: 6px;
  border: 1px solid #ccc;
  border-bottom: 2px solid #ddd;
  float: left;
}
.customoverlay:nth-of-type(n) {
  border: 0;
  box-shadow: 0px 1px 2px #888;
}
.customoverlay a {
  display: block;
  text-decoration: none;
  color: #000;
  text-align: center;
  border-radius: 6px;
  font-size: 14px;
  font-weight: bold;
  overflow: hidden;
  background: #d95050;
  background: #d95050
    url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
    no-repeat right 14px center;
}
.customoverlay .title {
  display: block;
  text-align: center;
  background: #fff;
  margin-right: 35px;
  padding: 10px 15px;
  font-size: 14px;
  font-weight: bold;
}
.customoverlay:after {
  content: "";
  position: absolute;
  margin-left: -12px;
  left: 50%;
  bottom: -12px;
  width: 22px;
  height: 12px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}
</style>
