import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import http from "@/util/http-common.js";

import jwt_decode from "jwt-decode";
import { login } from "@/api/member.js";
import { findById } from "@/api/member";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    houses: [],
    house: null,
    sigudongs: [{ value: null, jibun: null }],
    notices: [],
    notice: {},
    talks: [],
    talk: {},
    comments: [],
    restaurants: [],
    restaurant: null,
    // member
    isLogin: false,
    isLoginError: false,
    userInfo: null,
  },
  getters: {
    notices(state) {
      return state.notices;
    },
    notice(state) {
      return state.notice;
    },
    talks(state) {
      return state.talks;
    },
    talk(state) {
      return state.talk;
    },
    comments(state) {
      return state.comments;
    },
    sigudongs(state) {
      return state.sigudongs;
    },
    // member
    checkUserInfo(state) {
      return state.userInfo;
    },
  },
  mutations: {
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.sidoCode, text: sido.sidoName });
      });
    },
    SET_GUGUN_LIST(state, guguns) {
      guguns.forEach((gugun) => {
        state.guguns.push({ value: gugun.gugunCode, text: gugun.gugunName });
      });
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    SET_HOUSE_LIST(state, houses) {
      state.houses = houses;
    },
    SET_DETAIL_HOUSE(state, house) {
      state.house = house;
    },
    CLEAR_HOUSE_LIST(state) {
      state.houses = "";
    },
    SET_SIGUDONG_LIST(state, sigudongs) {
      sigudongs.forEach((sigudong) => {
        state.sigudongs.push({
          value: sigudong.법정동시군구코드 + "" + sigudong.법정동읍면동코드,
          jibun: sigudong.지번,
        });
      });
    },
    CLEAR_SIGUDONG_LIST(state) {
      state.sigudongs = [{ value: null, jibun: null }];
    },
    SET_RESTAURANT_LIST(state, restaurants) {
      state.restaurants = restaurants;
    },
    SET_DETAIL_RESTAURANT(state, restaurant) {
      state.restaurant = restaurant;
    },
    CLEAR_RESTAURANT_LIST(state) {
      state.restaurants = "";
    },
    SET_NOTICE_LIST(state, notices) {
      state.notices = notices;
    },
    SET_NOTICE(state, notice) {
      state.notice = notice;
    },
    SET_TALK_LIST(state, talks) {
      state.talks = talks;
    },
    SET_TALK(state, talk) {
      state.talk = talk;
    },
    SET_COMMENTS(state, comments) {
      state.comments = comments;
    },
    // member
    SET_IS_LOGIN: (state, isLogin) => {
      state.isLogin = isLogin;
    },
    SET_IS_LOGIN_ERROR: (state, isLoginError) => {
      state.isLoginError = isLoginError;
    },
    SET_USER_INFO: (state, userInfo) => {
      state.isLogin = true;
      state.userInfo = userInfo;
    },
    CLEAR_USER_INFO(state) {
      state.userInfo = null;
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get(`/map/sido`)
        .then((response) => {
          commit("SET_SIDO_LIST", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getGugun({ commit }, sidoCode) {
      const params = { sido: sidoCode };
      http
        .get(`/map/gugun`, { params })
        .then((response) => {
          commit("SET_GUGUN_LIST", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getHouseList({ commit }, gugunCode) {
      const SERVICE_KEY = process.env.VUE_APP_APT_DEAL_API_KEY;
      const SERVICE_URL =
        "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
      const params = {
        LAWD_CD: gugunCode,
        DEAL_YMD: "202110",
        serviceKey: decodeURIComponent(SERVICE_KEY),
      };
      http
        .get(SERVICE_URL, { params })
        .then((response) => {
          console.log(response);
          commit("SET_SIGUDONG_LIST", response.data.response.body.items.item);
          commit("SET_HOUSE_LIST", response.data.response.body.items.item);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detailHouse({ commit }, house) {
      commit("SET_DETAIL_HOUSE", house);
    },
    getNoticeList({ commit }) {
      http
        .get(`/notice`)
        .then((response) => {
          console.log(response.data);
          commit("SET_NOTICE_LIST", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getRestaurantList(context, addr) {
      http.get(`/map/restaurant?addr=${addr}`).then(({ data }) => {
        context.commit("SET_RESTAURANT_LIST", data);
      });
    },
    detailRestaurant({ commit }, restaurant) {
      commit("SET_DETAIL_RESTAURANT", restaurant);
    },
    getNotice(context, articleno) {
      http.get(articleno).then(({ data }) => {
        context.commit("SET_NOTICE", data);
      });
    },
    getTalks(context) {
      http
        .get(`/talk`)
        .then(({ data }) => {
          context.commit("SET_TALK_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getTalk(context, talk_no) {
      http.get(talk_no).then(({ data }) => {
        context.commit("SET_TALK", data);
      });
    },
    getAptTalks(context, apt) {
      http
        .get(apt)
        .then(({ data }) => {
          context.commit("SET_TALK_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getComments(context, comments) {
      http.get(comments).then(({ data }) => {
        context.commit("SET_COMMENTS", data);
      });
    },
    // memeber
    async userConfirm({ commit }, member) {
      await login(
        member,
        (response) => {
          if (response.data.message === "success") {
            let token = response.data["access-token"];
            commit("SET_IS_LOGIN", true);
            commit("SET_IS_LOGIN_ERROR", false);
            sessionStorage.setItem("access-token", token);
          } else {
            commit("SET_IS_LOGIN", false);
            commit("SET_IS_LOGIN_ERROR", true);
          }
        },
        () => {}
      );
    },
    getUserInfo({ commit }, token) {
      let decode_token = jwt_decode(token);
      console.warn(decode_token);
      findById(
        decode_token.login_id,
        (response) => {
          console.log(response.data);
          if (response.data.message === "success") {
            commit("SET_USER_INFO", response.data.userInfo);
          } else {
            console.log("유저 정보 없음!!");
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
  modules: {},
  plugins: [createPersistedState()],
});
