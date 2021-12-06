import { apiInstance } from "./index.js";

const api = apiInstance();

async function login(member, success, fail) {
  await api
    .post(`/member/login`, JSON.stringify(member))
    .then(success)
    .catch(fail);
}

async function findById(login_id, success, fail) {
  api.defaults.headers["access-token"] = sessionStorage.getItem("access-token"); // 헤더에 access-token 정보 담아서 가져가기
  await api.get(`/member/info/${login_id}`).then(success).catch(fail); // path variable로 userid 담아감
}

export { login, findById };
