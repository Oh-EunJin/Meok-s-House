<template>
  <div id="loginpage">
    <b-alert class="mb-3" :value="isLoginError" type="error">
      아이디와 비밀번호를 확인해주세요.
    </b-alert>
    <b-alert class="mb-3" :value="isLogin" type="success">
      로그인이 완료되었습니다.
    </b-alert>
    <h3><b-icon icon="person-fill"></b-icon> 로그인</h3>
    <div class="deco"></div>
    <div class="loginform">
      <div class="login-form-container shadow">
        <div class="login-form-left-side">
          <div class="top-logo-wrap"></div>
          <h1>먹잘알 멤버이신가요?</h1>
          <p>
            먹잘알 멤버이신가요? <br />
            아이디와 비밀번호를 입력해주세요.
          </p>
        </div>
        <div class="login-form-right-side">
          <div class="login-top-wrap">
            <button class="create-account-btn shadow-light" @click="movePage">
              SignUp
            </button>
          </div>
          <div class="login-input-container">
            <b-alert show variant="danger" v-if="isLoginError"
              >아이디 또는 비밀번호를 확인하세요.</b-alert
            >
            <div class="login-input-wrap input-id">
              <i class="far fa-envelope"></i>
              <input
                id="login_id"
                placeholder="ID"
                type="text"
                v-model="member.login_id"
                @keyup.enter="confirm"
              />
            </div>
            <div class="login-input-wrap input-password">
              <i class="fas fa-key"></i>
              <input
                id="password"
                placeholder="Password"
                type="password"
                v-model="member.password"
                @keyup.enter="confirm"
              />
            </div>
          </div>
          <div class="login-btn-wrap">
            <button class="login-btn" @click="confirm">Login</button>

            <router-link :to="{ name: 'SearchPw' }"
              >Forgot password?</router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  data() {
    return {
      member: {
        login_id: null,
        password: null,
      },
    };
  },
  computed: {
    ...mapState(["isLogin", "isLoginError"]),
  },
  methods: {
    ...mapActions(["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.member); // user를 보냄
      let token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token);
        this.$router.push({ name: "Home" });
      }
    },
    movePage() {
      this.$router.push({ name: "SignUp" });
    },
  },
};
</script>

<style scoped>
.loginform {
  width: 100vw;
  height: 100vh;
  background: #eff0f2;
  justify-content: center;
  align-items: center;
  display: flex;
  margin-bottom: 10%;
}
.shadow {
  -webkit-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
  -moz-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
  box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
}
.login-form-container {
  background: #f5f5f5;
  width: 860px;
  height: 540px;
  display: flex;
  flex-direction: row;
  box-shadow: 10px black;
  border-radius: 10px;
}
.login-form-left-side {
  width: 50%;
  border-radius: 10px 0px 0px 10px;
  padding: 75px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #f2f2f2;
  background-image: radial-gradient(
    ellipse farthest-corner at 0 140%,
    #dbc9b5 0%,
    #c0a27e 70%,
    #a67e4b 70%
  );
}
.login-form-left-side h1 {
  color: #f2f2f2;
  width: 100%;
  text-align: right;
  opacity: 0.9;
}
.login-form-left-side p {
  padding-top: 50px;
  font-size: 12px;
  text-align: right;
  opacity: 0.8;
}
.login-form-right-side {
  width: 50%;
  border-radius: 0px 10px 10px 0px;
  display: flex;

  flex-direction: column;
  align-items: center;
  padding: 40px;
  background: rgb(255, 255, 255);
  background: linear-gradient(
    287deg,
    rgba(255, 255, 255, 1) 0%,
    rgba(243, 244, 244, 1) 0%,
    rgba(255, 255, 255, 1) 100%
  );
}
.login-form-right-side .login-top-wrap {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 100%;
}
.login-form-right-side .login-top-wrap span {
  color: gray;
  font-size: 11px;
  padding-right: 20px;
}
.login-form-right-side .login-top-wrap .create-account-btn {
  background: white;
  border: 1px solid #c0a27e;
  width: 85px;
  height: 35px;
  font-size: 11px;
  color: #c0a27e;
  border-radius: 3px;
}
.login-input-container {
  padding-top: 120px;
  width: 300px;
}
.login-input-container .login-input-wrap {
  width: 300px;
  height: 45px;
  margin-top: 20px;
  border-radius: 2px;
  border-bottom: solid 2px #c0a27e;
}
.login-input-container .login-input-wrap i {
  color: #c0a27e;
  line-height: 45px;
}

.login-input-container .login-input-wrap input {
  background: none;
  border: none;
  line-height: 45px;
  padding-left: 10px;
  width: 267px;
}
.login-input-container .login-input-wrap input:focus {
  outline: none;
}
.login-btn-wrap {
  margin-top: 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.login-btn-wrap .login-btn {
  width: 95px;
  height: 35px;
  color: white;
  border: 0;
  border-radius: 4px;

  background: #c0a27e;
}
.login-btn-wrap a {
  margin-top: 10px;
  text-decoration: none;
  font-size: 11px;
  color: gray;
}
</style>
