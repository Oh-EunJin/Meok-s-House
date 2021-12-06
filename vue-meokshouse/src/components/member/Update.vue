<template>
  <div>
    <h3><b-icon icon="lock-fill"></b-icon> 회원 정보 수정</h3>
    <div class="deco"></div>
    <div class="editform">
      <div class="edit-form-container shadow">
        <div class="edit-form-left-side">
          <div class="top-logo-wrap"></div>
          <h1>Meok's House를 찾아주셔서 감사합니다.</h1>
          <p>
            Meok's House 서비스를 이용할 회원 정보를<br />
            수정해주세요.
          </p>
        </div>
        <div class="edit-form-right-side">
          <div class="edit-input-container">
            <div class="edit-input-wrap input-id">
              <div><span>*</span>아이디</div>
              <input
                type="text"
                v-model="member.login_id"
                ref="login_id"
                required
                readonly
                value="userInfo.login_id"
              />
            </div>
            <div class="edit-input-wrap input-password">
              <div><span>*</span>비밀번호</div>
              <input
                type="password"
                v-model="member.password"
                ref="password"
                required
                value="userInfo.password"
              />
            </div>
            <div class="edit-input-wrap input-name">
              <div><span>*</span>이름</div>
              <input type="text" v-model="member.name" ref="name" required />
            </div>
            <div class="edit-input-wrap input-addr">
              <div><span>*</span>주소</div>
              <input
                type="text"
                v-model="member.address"
                ref="address"
                required
                value="userInfo.address"
              />
            </div>
            <div class="edit-input-wrap input-phone">
              <div><span>*</span>휴대폰 번호</div>
              <input
                type="text"
                v-model="member.phone_number"
                ref="phone_number"
                required
                value="userInfo.phone_number"
              />
            </div>
          </div>
          <div class="member-btn-group">
            <button class="edit-btn" @click="updateMember">정보 수정</button>
            <router-link class="reset-btn" :to="{ name: 'Home' }"
              >취소</router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";
import { mapState } from "vuex";

export default {
  name: "Update",
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
  computed: {
    ...mapState(["userInfo"]),
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
    updateMember() {
      http
        .put(`/member`, {
          login_id: this.member.login_id,
          name: this.member.name,
          password: this.member.password,
          address: this.member.address,
          phone_number: this.member.phone_number,
        })
        .then(({ data }) => {
          console.log(data);
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          this.movePage();
        });
    },
    movePage() {
      this.$router.push("/");
    },
  },
};
</script>

<style scoped>
.editform {
  width: 100vw;
  height: 100vh;
  background: #eff0f2;
  justify-content: center;
  align-items: center;
  display: flex;
  font-size: 20px;
}
.shadow {
  -webkit-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
  -moz-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
  box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
}
.edit-form-container {
  background: #f5f5f5;
  width: 950px;
  height: 540px;
  display: flex;
  flex-direction: row;
  box-shadow: 10px black;
  border-radius: 10px;
}
.edit-form-left-side {
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
.edit-form-left-side h1 {
  color: #f2f2f2;
  width: 100%;
  text-align: right;
  opacity: 0.9;
}
.edit-form-left-side p {
  padding-top: 50px;
  font-size: 12px;
  text-align: right;
  opacity: 0.8;
}
.edit-form-right-side {
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
.edit-input-container {
  padding-top: 10px;
  width: 90%;
}
.edit-input-container .edit-input-wrap {
  width: 100%;
  height: 45px;
  margin-top: 20px;
  border-radius: 2px;
  border-bottom: solid 2px #c0a27e;
  display: flex;
  justify-content: space-between;
}
.edit-input-container .edit-input-wrap i {
  color: #c0a27e;
  line-height: 45px;
}

.edit-input-container .edit-input-wrap input {
  background: none;
  font-size: 15px;
  border: none;
  line-height: 45px;
  padding-left: 1em;
  width: 70%;
}
.edit-input-container .login-input-wrap input:focus {
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
.member-btn-group {
  margin-top: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.member-btn-group .edit-btn {
  width: 95px;
  height: 35px;
  color: #c0a27e;
  border: 1px solid #c0a27e;
  border-radius: 4px;
  margin: 1em;
  background: white;
  font-size: 18px;
}
.member-btn-group .reset-btn {
  width: 95px;
  height: 35px;
  color: #c0a27e;
  border: 1px solid #c0a27e;
  border-radius: 4px;
  background: white;
  margin: 1em;
}
.member-btn-group a {
  margin-top: 10px;
  text-decoration: none;
  font-size: 18px;
  line-height: 35px;
  color: gray;
}
</style>
