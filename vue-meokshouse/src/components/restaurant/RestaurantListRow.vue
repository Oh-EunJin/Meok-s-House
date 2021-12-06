<template>
  <div>
    <b-row
      class="mt-3 mb-3"
      @click="selectRestaurant"
      @mouseout="colorChange(false)"
      :class="{ 'mouse-over-bgcolor': isColor }"
    >
      <b-col cols="2" class="text-center align-self-center">
        <b-img
          thumbnail
          src="https://picsum.photos/250/250/?image=58"
          alt="Image 1"
        ></b-img>
      </b-col>
      <b-col cols="10" class="align-self-center" @click="isModal = true">
        [{{ restaurant.entrp_nm }}] &nbsp;&nbsp; {{ restaurant.load_addr }}
      </b-col>
    </b-row>
    <restaurant-modal v-if="isModal" @close-modal="isModal = false" />
  </div>
</template>

<script>
import { mapActions } from "vuex";
import RestaurantModal from "./RestaurantModal.vue";

export default {
  components: {
    RestaurantModal,
  },
  name: "RestaurantListRow",
  data() {
    return {
      isColor: false,
      isModal: false,
    };
  },
  props: {
    restaurant: Object,
  },
  methods: {
    ...mapActions(["detailRestaurant"]),
    colorChange(flag) {
      this.isColor = flag;
    },
    selectRestaurant() {
      this.detailRestaurant(this.restaurant);
    },
  },
};
</script>

<style scoped>
.apt {
  width: 50px;
}
.mouse-over-bgcolor {
  background-color: lightblue;
}
</style>
