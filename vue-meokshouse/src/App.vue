<template>
  <div id="app">
    <navi-bar />
    <router-view />
    <footer-part />
  </div>
</template>

<script>
import NaviBar from "@/components/layout/NaviBar.vue";
import FooterPart from "@/components/layout/FooterPart.vue";

export default {
  components: {
    NaviBar,
    FooterPart,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  list-style: none;
  text-decoration: none;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
}

li {
  list-style-type: none;
}
</style>
