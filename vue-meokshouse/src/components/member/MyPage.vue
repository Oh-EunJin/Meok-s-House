<template>
  <div id="mypage" v-if="userInfo">
    <h3><b-icon icon="person-fill"></b-icon> MyPage</h3>
    <div class="deco"></div>
    <div class="mypageform">
      <div class="mypage-form-container shadow">
        <div class="mypage-form-left-side">
          <div class="top-logo-wrap"></div>
          <h1>Meok's House <br />가족이시군요!</h1>
          <p>
            먹잘알 멤버이신가요? <br />
            아이디와 비밀번호를 입력해주세요.
          </p>
        </div>
        <div class="mypage-form-right-side">
          <div class="mypage-input-container">
            <div class="mypage-input-wrap input-id">
              <input
                id="login_id"
                placeholder="ID"
                type="text"
                v-model="member.login_id"
                readonly
              />
            </div>
            <div class="mypage-input-wrap input-password">
              <input
                id="password"
                placeholder="Password"
                type="password"
                v-model="member.password"
              />
            </div>
            <div class="mypage-input-wrap input-password">
              <input
                id="name"
                placeholder="Name"
                type="text"
                v-model="member.name"
              />
            </div>
            <div class="mypage-input-wrap input-password">
              <input
                id="address"
                placeholder="Address"
                type="text"
                v-model="member.address"
              />
            </div>
            <div class="mypage-input-wrap input-password">
              <input
                id="phone"
                placeholder="PhoneNumber"
                type="text"
                v-model="member.phone_number"
              />
            </div>
          </div>
          <div class="mypage-btn-wrap">
            <div class="mypage-btn">
              <router-link :to="`/member/update`">정보수정</router-link>
            </div>
            <div class="mypage-btn">
              <a href="/" @click="deleteMember">회원탈퇴</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import http from "@/util/http-common";

export default {
  name: "MyPage",
  computed: {
    ...mapState(["userInfo"]),
    ...mapMutations(["CLEAR_USER_INFO"]),
  },
  data() {
    return {
      member: {
        name: null,
        login_id: null,
        password: null,
        address: null,
        phone_number: null,
      },
    };
  },
  created() {
    http.get(`/member/${this.userInfo.login_id}`).then(({ data }) => {
      this.member.login_id = data.login_id;
      this.member.name = data.name;
      this.member.password = data.password;
      this.member.address = data.address;
      this.member.phone_number = data.phone_number;
    });
  },
  methods: {
    deleteMember() {
      if (confirm("정말로 탈퇴하시겠습니까?")) {
        http
          .delete(`/member/${this.userInfo.login_id}`)
          .then(({ data }) => {
            console.log(data);
            this.CLEAR_USER_INFO();
            this.$router.push({ name: "Home" });
          })
          .catch((error) => {
            console.log(error);
          });
        this.CLEAR_USER_INFO();
      }
    },
  },
};
</script>

<style>
.mypageform {
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
.mypage-form-container {
  background: #f5f5f5;
  width: 950px;
  height: 540px;
  display: flex;
  flex-direction: row;
  box-shadow: 10px black;
  border-radius: 10px;
}
.mypage-form-left-side {
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
.mypage-form-left-side h1 {
  color: #f2f2f2;
  width: 100%;
  text-align: right;
  opacity: 0.9;
}
.mypage-form-left-side p {
  padding-top: 50px;
  font-size: 12px;
  text-align: right;
  opacity: 0.8;
}
.mypage-form-right-side {
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
.mypage-form-right-side .mypage-top-wrap {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 100%;
}
.mypage-form-right-side .mypage-top-wrap span {
  color: gray;
  font-size: 11px;
  padding-right: 20px;
}
.mypage-input-container {
  padding-top: 10px;
  width: 90%;
}
.mypage-input-container .mypage-input-wrap {
  width: 100%;
  height: 45px;
  margin-top: 20px;
  border-radius: 2px;
  border-bottom: solid 2px #c0a27e;
  display: flex;
}
.mypage-input-container .mypage-input-wrap i {
  color: #c0a27e;
  line-height: 45px;
}

.mypage-input-container .mypage-input-wrap input {
  background: none;
  font-size: 15px;
  border: none;
  line-height: 45px;
  padding-left: 1em;
  width: 80%;
  display: flex;
  justify-content: flex-start;
}
.mypage-input-container .mypage-input-wrap input:focus {
  outline: none;
}
.mypage-btn-wrap {
  margin-top: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.mypage-btn-wrap .mypage-btn {
  width: 95px;
  height: 35px;
  color: #c0a27e;
  border: 1px solid #c0a27e;
  border-radius: 4px;
  background: white;
  margin-right: 0.5em;
}
.mypage-btn-wrap .mypage-btn a {
  margin-top: 1em;
  text-decoration: none;
  font-size: 18px;
  color: #a67e4b;
  line-height: 35px;
}
</style>
