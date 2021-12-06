<template>
  <div id="notice">
    <h3><b-icon icon="bell-fill"></b-icon>Notice</h3>
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
