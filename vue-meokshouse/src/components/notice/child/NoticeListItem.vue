<template>
  <b-tr>
    <b-td>{{ no }}</b-td>
    <b-th class="text-left">
      <router-link
        id="subject"
        :to="{ name: 'NoticeView', params: { articleno: articleno } }"
        >{{ subject }}</router-link
      >
    </b-th>
    <b-td>{{ login_id }}</b-td>
    <b-td>{{ regtime }}</b-td>
    <b-td>{{ hits }}</b-td>
  </b-tr>
</template>

<script>
import moment from "moment";

export default {
  name: "NoticeListItem",
  props: {
    articleno: Number,
    no: String,
    login_id: String,
    subject: String,
    hits: Number,
    regtime: String,
  },
  computed: {
    changeDateFormat() {
      return moment(new Date(this.regtime)).format("YY.MM.DD hh:mm:ss");
    },
  },
};
</script>

<style>
#subject {
  text-decoration: none;
  color: #2c3e50;
}
</style>
