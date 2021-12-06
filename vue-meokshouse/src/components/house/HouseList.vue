<template>
  <div>
    <b-container v-if="houses && houses.length != 0" class="bv-example-row">
      <house-list-row
        v-for="(house, index) in houses"
        :key="index"
        :house="house"
      />
    </b-container>
    <b-container v-else class="bv-example-row">
      <b-row>
        <b-col
          ><b-alert class="list" show>아파트 목록이 없습니다.</b-alert></b-col
        >
      </b-row>
    </b-container>
  </div>
</template>

<script>
import HouseListRow from "@/components/house/HouseListRow.vue";
import { mapState } from "vuex";

export default {
  name: "HouseList",
  components: {
    HouseListRow,
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(["houses"]),
  },
};
</script>

<style scoped>
.list {
  margin-top: 2em;
  background-color: #f2f2f2;
  border-color: #f2f2f2;
  color: #2c3e50;
}
.container {
  border: 1px solid #d6ae7b;
  margin-top: 5.3em;
}
</style>
