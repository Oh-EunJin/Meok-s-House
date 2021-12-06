<template>
  <div id="loginpage">
    <h3><b-icon icon="person-fill"></b-icon> 비밀번호 찾기</h3>
    <div class="deco"></div>
    <div class="loginform">
      <div class="login-form-container shadow">
        <div class="login-form-right-side">
          <div class="top-logo-wrap"></div>
          <h1>비밀번호를 까먹으셨나요?</h1>
          <p>
            비밀번호를 까먹으셨나요? <br />
            아이디와 이름, 전화번호를 입력해주세요.
          </p>
        </div>
        <div class="login-form-left-side">
          <div class="login-top-wrap">
            <button class="create-account-btn shadow-light" @click="moveLogin">
              Login
            </button>
          </div>
          <div class="login-input-container">
            <div class="login-input-wrap input-id">
              <i class="far fa-envelope"></i>
              <input
                id="login_id"
                placeholder="ID"
                type="text"
                v-model="member.login_id"
                @keyup.enter="search"
              />
            </div>
            <div class="login-input-wrap input-name">
              <i class="fas fa-key"></i>
              <input
                id="name"
                placeholder="Name"
                type="text"
                v-model="member.name"
                @keyup.enter="search"
              />
            </div>
            <div class="login-input-wrap input-phone_number">
              <i class="fas fa-key"></i>
              <input
                id="phone_number"
                placeholder="phone_number"
                type="text"
                v-model="member.phone_number"
                @keyup.enter="search"
              />
            </div>
            <div v-if="password != null">
              <p v-html="password" class="pw">
                {{ password }}
              </p>
            </div>
          </div>
          <div class="login-btn-wrap">
            <button class="login-btn" @click="search">비밀번호 찾기</button>
            <router-link :to="{ name: 'SignUp' }"
              >Do you want to SignUp?</router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";

export default {
  data() {
    return {
      member: {
        login_id: null,
        name: null,
        phone_number: null,
      },
      password: null,
    };
  },
  methods: {
    search() {
      http
        .post(`/member/passwordSearch/`, {
          login_id: this.member.login_id,
          name: this.member.name,
          phone_number: this.member.phone_number,
        })
        .then(({ data }) => {
          if (data != "") {
            console.log(data);
            this.password = `비밀번호는 ${data} 입니다. <br>
              로그인 후 비밀번호를 변경해주세요.`;
          } else {
            this.password = "회원정보가 올바르지 않습니다.";
            this.member.login_id = null;
            this.member.name = null;
            this.member.phone_number = null;
          }
        });
    },
    movePage() {
      this.$router.push({ name: "SignUp" });
    },
    moveLogin() {
      this.$router.push({ name: "Login" });
    },
  },
};
</script>

<style>
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
  height: 600px;
  display: flex;
  flex-direction: row;
  box-shadow: 10px black;
  border-radius: 10px;
}
.login-form-right-side {
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
.login-form-right-side h1 {
  color: #f2f2f2;
  width: 100%;
  text-align: right;
  opacity: 0.9;
}
.login-form-right-side p {
  padding-top: 50px;
  font-size: 12px;
  text-align: right;
  opacity: 0.8;
}
.login-form-left-side {
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
.login-form-left-side .login-top-wrap {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 100%;
}
.login-form-left-side .login-top-wrap span {
  color: gray;
  font-size: 11px;
  padding-right: 20px;
}
.login-form-left-side .login-top-wrap .create-account-btn {
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
  width: 120px;
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
.login-btn-wrap a:hover {
  text-decoration: none;
  color: #2c3e50;
}
.pw {
  color: red;
  margin-top: 20px;
}
</style>
