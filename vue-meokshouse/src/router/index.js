import Vue from "vue";
import VueRouter from "vue-router";

import Home from "../views/Home.vue";

import Member from "../views/Member.vue";
import Login from "@/components/member/LogIn.vue";
import SignUp from "@/components/member/SignUp.vue";
import SearchPw from "@/components/member/SearchPw.vue";
import MyPage from "@/components/member/MyPage.vue";
import Update from "@/components/member/Update.vue";

import Apt from "../views/Apt.vue";
import Restaurant from "@/components/restaurant/Restaurant.vue";

import Notice from "../views/Notice.vue";
import NoticeList from "@/components/notice/NoticeList.vue";
import NoticeWrite from "@/components/notice/NoticeWrite.vue";
import NoticeView from "@/components/notice/NoticeView.vue";
import NoticeModify from "@/components/notice/NoticeModify.vue";

import Talk from "../views/Talk.vue";
import TalkList from "@/components/talk/TalkList.vue";
import TalkCreate from "@/components/talk/TalkCreate.vue";
import TalkView from "@/components/talk/TalkView.vue";
import TalkModify from "@/components/talk/TalkModify.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/member",
    name: "Member",
    component: Member,
    children: [
      {
        path: "login",
        name: "Login",
        component: Login,
      },
      {
        path: "signup",
        name: "SignUp",
        component: SignUp,
      },
      {
        path: "searchpw",
        name: "SearchPw",
        component: SearchPw,
      },
      {
        path: "mypage",
        name: "MyPage",
        component: MyPage,
      },
      {
        path: "update",
        name: "Update",
        component: Update,
      },
    ],
  },

  {
    path: "/apt",
    name: "Apt",
    component: Apt,
  },
  {
    path: "/restaurant",
    name: "Restaurant",
    component: Restaurant,
  },
  {
    path: "/notice",
    name: "Notice",
    component: Notice,
    redirect: "/notice/list",
    children: [
      {
        path: "list",
        name: "NoticeList",
        component: NoticeList,
      },
      {
        path: "write",
        name: "NoticeWrite",
        component: NoticeWrite,
      },
      {
        path: "detail/:articleno",
        name: "NoticeView",
        component: NoticeView,
      },
      {
        path: "modify/:articleno",
        name: "NoticeModify",
        component: NoticeModify,
      },
    ],
  },
  {
    path: "/talk",
    name: "Talk",
    component: Talk,
    redirect: "/talk/list",
    children: [
      {
        path: "list",
        name: "talk-list",
        component: TalkList,
      },
      {
        path: "create",
        name: "talk-create",
        component: TalkCreate,
      },
      {
        path: "view",
        name: "talk-view",
        component: TalkView,
      },
      {
        path: "modify/:talk_no",
        name: "talk-modify",
        component: TalkModify,
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
