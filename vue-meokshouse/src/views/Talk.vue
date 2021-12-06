<template>
  <div id="notice">
    <h3><b-icon icon="chat-left-dots-fill"></b-icon>Talk</h3>
    <div class="deco"></div>
    <div>
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.deco {
  border-bottom: 2px solid #2c3e50;
  height: 30px;
  width: 100px;
  display: inline-block;
  margin-bottom: 30px;
}
</style>
