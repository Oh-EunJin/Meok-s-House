<template>
  <div id="header">
    <div id="logo">
      <h1>
        <router-link to="/">
          <img
            :src="require('@/assets/MeoksHouse.png')"
            alt="logo.png"
            width="110px"
            height="110px"
          />
        </router-link>
      </h1>
    </div>
    <div id="lnb">
      <div id="nav">
        <ul class="nav-container">
          <li class="nav-item"><router-link to="/">Home</router-link></li>
          <li class="nav-item"><router-link to="/apt">Apt</router-link></li>
          <li class="nav-item">
            <router-link to="/notice">Notice</router-link>
          </li>
          <li class="nav-item"><router-link to="/talk">Talk</router-link></li>
        </ul>
      </div>
    </div>
    <div class="user" v-if="userInfo">
      <ul>
        <li>
          <router-link to="/member/mypage"
            ><b-icon icon="person-fill"></b-icon>MyPage</router-link
          >
        </li>
        <li>
          <a href="/" @click.prevent="onClickLogout"
            ><b-icon icon="door-open-fill"></b-icon>Logout</a
          >
        </li>
      </ul>
    </div>
    <div class="user" v-else>
      <ul>
        <li>
          <router-link to="/member/login"
            ><b-icon icon="person-fill"></b-icon>Login</router-link
          >
        </li>
        <li>
          <router-link to="/member/signup"
            ><b-icon icon="lock-fill"></b-icon>Signup</router-link
          >
        </li>
      </ul>
    </div>
    <div class="desc">
      <h1>먹잘알들의 꿈의 집</h1>
      <h3>을 구해드립니다</h3>
    </div>
    <div class="visual"></div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "NaviBar",
  computed: {
    ...mapState(["isLogin", "userInfo"]),
  },
  methods: {
    ...mapMutations(["SET_IS_LOGIN", "SET_USER_INFO"]),
    onClickLogout() {
      this.SET_IS_LOGIN(false);
      this.SET_USER_INFO(null);
      sessionStorage.removeItem("access-token");
      if (this.$route.path != "/") this.$router.push({ name: "Home" });
    },
  },
  created() {
    console.log(this.userInfo);
    if (this.userInfo === "") {
      this.SET_IS_LOGIN(false);
      sessionStorage.removeItem("access-token");
    }
  },
};
</script>

<style>
#header {
  padding: 0 30px 30px;
  background: linear-gradient(
    to right,
    #d6ae7b,
    #d6ae7b 50%,
    #f2f2f2 50%,
    #f2f2f2
  );
  margin-bottom: 40px;
}
#header li {
  list-style-type: none;
  font-weight: bold;
}
#header a {
  font-weight: bold;
  font-size: 18px;
  text-decoration: none;
}
#header #logo h1 {
  display: flex;
  top: 0;
  position: absolute;
  left: 30px;
  width: 180px;
  height: 70px;
  background-color: #d6ae7b;
}
#header #logo h1 img {
  position: absolute;
  top: -1em;
  left: 2em;
}
#header .desc h1 {
  color: #fff;
  position: absolute;
  top: 250px;
  width: 500px;
}
#header .desc h3 {
  color: #fff;
  position: absolute;
  top: 300px;
  left: 150px;
  width: 500px;
}
#header .visual {
  height: 500px;
  overflow: hidden;
  background-image: url("https://images.pexels.com/photos/7314805/pexels-photo-7314805.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=1500");
  background-size: 100%;
  background-position-y: -160px;
  background-repeat: no-repeat;
}
#header h1 {
  position: absolute;
  left: 30px;
  top: 0;
}
#header .user {
  padding-left: 30px;
}
#header .user ul {
  display: flex;
  top: 0;
  position: absolute;
  right: 30px;
  width: 180px;
  height: 70px;
  background-color: #f2f2f2;
  padding: 0;
}
#header .user li {
  flex: 1;
  line-height: 70px;
  justify-content: right;
  padding: 0;
}
#header .user li a {
  color: #2c3e50;
  font-size: 15px;
}
#header .user li a svg {
  width: 1.3em;
  margin-right: 3px;
}

#header #lnb {
  position: absolute;
  right: 2em;
  left: 0;
  top: 0;
  padding: 0 13em;
  width: 100%;
  box-sizing: border-box;
}
#header #lnb #nav {
  border-bottom: 1px solid rgba(255, 255, 255, 0.5);
  height: 70px;
}
#header #lnb #nav > ul {
  text-align: center;
}
#header #lnb #nav > ul > li {
  display: inline-block;
}
#header #lnb #nav > ul > li > a {
  display: block;
  color: #fff;
  width: 160px;
  height: 69px;
  line-height: 69px;
  position: relative;
}
#header #lnb #nav > ul > li > a:after {
  content: "";
  position: absolute;
  left: 50%;
  bottom: -1px;
  width: 0;
  height: 2px;
  background-color: #fff;
  transition: all 0.5s;
}
#header #lnb #nav > ul > li > a:hover:after {
  left: 0;
  width: 100%;
}
</style>
