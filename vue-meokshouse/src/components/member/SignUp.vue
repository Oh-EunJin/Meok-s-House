<template>
  <div>
    <h3><b-icon icon="lock-fill"></b-icon> 회원가입</h3>
    <div class="deco"></div>
    <p style="color: #2c3e50">
      <b>먹잘알들의 꿈의 동산</b><br /><br />
      Meok's House를 찾아주셔서 감사합니다.<br /><br />
      회원이 되시면 Meok's House만의 서비스를 누릴 수 있습니다.
    </p>
    <div class="joinform">
      <div class="login-form-container shadow">
        <div class="login-form-left-side">
          <div class="top-logo-wrap"></div>
          <h1>Meok's House를 찾아주셔서 감사합니다.</h1>
          <p>회원이 되시면 Meok's House만의 서비스를 누릴 수 있습니다.</p>
        </div>
        <div class="login-form-right-side">
          <div class="login-input-container">
            <div class="login-input-wrap input-id">
              <input
                id="login_id"
                placeholder="ID"
                type="text"
                v-model="member.login_id"
                ref="login_id"
                required
              />
              <button class="sub-btn" @click="idcheck">check</button>
            </div>
            <div class="login-input-wrap input-password">
              <input
                id="password"
                placeholder="Password"
                type="password"
                v-model="member.password"
                ref="password"
                required
              />
              <button class="sub-btn" @click="random">random</button>
            </div>
            <div v-html="this.randomPw" class="pw-info">
              {{ this.randomPw }}
            </div>
            <div class="login-input-wrap input-name">
              <input
                id="name"
                placeholder="Name"
                type="text"
                v-model="member.name"
                ref="name"
                required
              />
            </div>
            <div class="login-input-wrap input-addr">
              <input
                id="address"
                placeholder="Address"
                type="text"
                v-model="member.address"
                ref="address"
                required
              />
            </div>
            <div class="login-input-wrap input-phone">
              <input
                id="phone"
                placeholder="PhoneNumber"
                type="text"
                v-model="member.phone_number"
                ref="phone_number"
                required
              />
            </div>
          </div>
          <div class="login-btn-wrap">
            <button class="signup-btn" @click="join">SignUp</button>
            <button class="reset-btn" @click="reset">Reset</button>
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
        name: null,
        login_id: null,
        password: null,
        address: null,
        phone_number: null,
      },
      isLoginid: false,
      randomPw: null,
    };
  },
  computed: {
    state() {
      return (
        this.member.password.length >= 6 && this.member.password.length <= 20
      );
    },
    invalidFeedback() {
      if (this.member.password.length > 0) {
        return "비밀번호는 6자이상 20자이하여야 합니다.";
      }
      return "비밀번호를 입력해주세요.";
    },
  },
  methods: {
    join() {
      let err = true;
      let msg = "";
      !this.member.login_id &&
        ((msg = "아이디를 입력해주세요"),
        (err = false),
        this.$refs.login_id.focus());
      err &&
        !this.member.name &&
        ((msg = "이름을 입력해주세요"), (err = false), this.$refs.name.focus());
      err &&
        !this.member.password &&
        ((msg = "비밀번호를 입력해주세요"),
        (err = false),
        this.$refs.password.focus());
      err &&
        !this.member.address &&
        ((msg = "주소를 입력해주세요"),
        (err = false),
        this.$refs.address.focus());
      err &&
        !this.member.phone_number &&
        ((msg = "전화번호를 입력해주세요"),
        (err = false),
        this.$refs.phone_number.focus());

      if (this.isLoginid == false) {
        alert("아이디 중복 체크 해주세요!");
        this.$refs.login_id.focus();
      }

      if (!err) alert(msg);
      else this.registerMember();
    },
    registerMember() {
      if (this.isLoginid === true) {
        http
          .post(`/member`, {
            login_id: this.member.login_id,
            name: this.member.name,
            password: this.member.password,
            address: this.member.address,
            phone_number: this.member.phone_number,
          })
          .then(({ data }) => {
            console.log(data);
            alert("먹잘알 멤버가 되셨습니다! \n로그인을 해주세요.");
            this.movePage();
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
    idcheck() {
      http
        .get(`/member/idcheck/${this.member.login_id}`)
        .then(({ data }) => {
          if (data === 0) {
            this.isLoginid = true;
            alert("사용 가능한 아이디입니다.");
          } else {
            this.isLoginid = false;
            this.member.login_id = null;
            alert("이미 사용 중인 아이디입니다.");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    random() {
      var randomPw = "";
      var characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      var charactersLength = characters.length;

      function rand(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      }

      var length = rand(6, 11);

      for (var i = 0; i < length; i++) {
        randomPw += characters.charAt(
          Math.floor(Math.random() * charactersLength)
        );
      }

      console.log(randomPw);

      this.member.password = randomPw;

      this.randomPw = "랜덤으로 생성된 비밀번호는 " + randomPw + " 입니다.";
    },
    movePage() {
      this.$router.push({ name: "Login" });
    },
    reset() {
      this.$router.push({ name: "Home" });
    },
  },
};
</script>

<style scoped>
.joinform {
  width: 100vw;
  height: 120vh;
  background: #eff0f2;
  justify-content: center;
  align-items: center;
  display: flex;
  font-size: 20px;
}
.loginform {
  width: 100vw;
  height: 80vh;
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
  width: 950px;
  height: 540px;
  display: flex;
  flex-direction: row;
  box-shadow: 10px black;
  border-radius: 10px;
}
.login-form-left-side {
  width: 45%;
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
  width: 55%;
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
  padding-top: 10px;
  width: 90%;
}
.login-input-container .login-input-wrap {
  width: 100%;
  height: 45px;
  margin-top: 20px;
  border-radius: 2px;
  border-bottom: solid 2px #c0a27e;
  display: flex;
}
.login-input-container .login-input-wrap i {
  color: #c0a27e;
  line-height: 45px;
}

.login-input-container .login-input-wrap input {
  background: none;
  font-size: 15px;
  border: none;
  line-height: 45px;
  padding-left: 1em;
  width: 80%;
  display: flex;
  justify-content: flex-start;
}
.login-input-container .login-input-wrap input:focus {
  outline: none;
}
.sub-btn {
  width: 70px;
  height: 35px;
  color: white;
  border: 0;
  border-radius: 4px;
  font-size: 15px;
  background: #c0a27e;
}
.login-btn-wrap {
  margin-top: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.login-btn-wrap .signup-btn {
  width: 95px;
  height: 35px;
  color: white;
  border: 0;
  border-radius: 4px;
  margin: 1em;
  background: #c0a27e;
}
.login-btn-wrap .reset-btn {
  width: 95px;
  height: 35px;
  color: white;
  border: 0;
  border-radius: 4px;
  background: #c0a27e;
  margin: 1em;
}
.login-btn-wrap a {
  margin-top: 10px;
  text-decoration: none;
  font-size: 11px;
  color: gray;
}
.pw-info {
  margin-bottom: 0px;
  color: #9a6d37;
  font-size: 15px;
  font: bold;
  position: absolute;
}
</style>
