<template>
  <div id="About">
    <h2 class="text-center">About</h2>
    <div class="deco"></div>
    <p>Meok's House는 다음과 같은 기능을 제공합니다.</p>
    <div class="icons">
      <div class="icon">
        <b-iconstack font-scale="5" style="width: 120px; height: 120px">
          <b-icon
            stacked
            icon="house"
            scale="0.5"
            style="color: #d6ae7b"
          ></b-icon>
          <b-icon stacked icon="circle" style="color: #d6ae7b"></b-icon>
        </b-iconstack>
        <div class="desc">
          <h5><strong>Home</strong></h5>
          <p>메인화면</p>
        </div>
      </div>
      <div class="icon">
        <b-iconstack font-scale="5" style="width: 120px; height: 120px">
          <b-icon
            stacked
            icon="search"
            scale="0.5"
            style="color: #d6ae7b"
          ></b-icon>
          <b-icon stacked icon="circle" style="color: #d6ae7b"></b-icon>
        </b-iconstack>
        <div class="desc">
          <h5><strong>Apt</strong></h5>
          <p>각 지역별 <br/>주택 실거래가 정보</p>
        </div>
      </div>
      <div class="icon">
        <b-iconstack font-scale="5" style="width: 120px; height: 120px">
          <b-icon
            stacked
            icon="chat-left-dots"
            scale="0.5"
            style="color: #d6ae7b"
          ></b-icon>
          <b-icon stacked icon="circle" style="color: #d6ae7b"></b-icon>
        </b-iconstack>
        <div class="desc">
          <h5><strong>Notice</strong></h5>
          <p>공지사항 &<br/> 자유게시판</p>
        </div>
      </div>
      <div class="icon">
        <b-iconstack font-scale="5" style="width: 120px; height: 120px">
          <b-icon
            stacked
            icon="question"
            scale="0.5"
            style="color: #d6ae7b"
          ></b-icon>
          <b-icon stacked icon="circle" style="color: #d6ae7b"></b-icon>
        </b-iconstack>
        <div class="desc">
          <h5><strong>Talk</strong></h5>
          <p>커뮤니티 게시판</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
#About {
  margin-top: 50px;
}
.icons {
  min-height: 300px;
  max-width: 80%;
  display: flex;
  justify-content: space-between;
  margin: 50px auto;
}
.icon {
  width: 300px;
  height: 300px;
}
.desc {
  margin-top: 30px;
  font-size: 1.2em;
}
</style>
