<template>
  <b-tr>
    <b-td>{{ no }}</b-td>
    <b-td>{{ login_id }}</b-td>
    <b-td>
      <router-link :to="`view?talk_no=${talk_no}`">{{ title }}</router-link>
    </b-td>
    <b-td>{{ apt }}</b-td>
    <b-td>{{ talk_time }}</b-td>
  </b-tr>
</template>

<script>
export default {
  name: "listrow",
  props: {
    no: String,
    talk_no: String,
    login_id: String,
    talk_time: String,
    apt: String,
    title: String,
    content: String,
  },
};
</script>
<style scoped>
td {
  text-align: center;
  border-bottom: 1px solid #ddd;
  height: 50px;
}

a {
  text-decoration: none;
  color: #2c3e50;
}
a:hover {
  text-decoration: none;
  color: #2c3e50;
}
</style>
