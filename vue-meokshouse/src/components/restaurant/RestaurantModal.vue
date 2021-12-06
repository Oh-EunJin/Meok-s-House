<template>
  <div class="modal-mask">
    <div class="modal-wrapper">
      <div class="modal-container">
        <div class="modal-header">
          <slot name="header"> {{ restaurant.entrp_nm }} </slot>
        </div>

        <div class="modal-body">
          <slot name="body"> 대표 메뉴 : {{ restaurant.represent_menu }} </slot>
          <br /><br />
          <slot v-if="restaurant.menu_pc != ''">
            가격 :
            {{
              (parseInt(restaurant.menu_pc.replace(",", "")) * 1000) | price
            }}원
          </slot>
          <slot v-else> 가격 : 제공하지 않음 </slot>
          <br /><br />
          <slot name="body"> 전화번호 : {{ restaurant.tel_no }} </slot>
        </div>

        <div class="modal-footer">
          <slot name="footer">
            <button class="modal-default-button" @click="$emit('close-modal')">
              Close
            </button>
          </slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "RestaurantModal",
  computed: {
    ...mapState(["restaurant"]),
  },
  filters: {
    price(value) {
      if (!value) return value;
      else return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },
};
</script>

<style>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 300px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
  transition: all 0.3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}

.modal-body {
  margin: 20px 0;
}

.modal-default-button {
  float: right;
  color: white;
  border: 0;
  border-radius: 4px;

  background: #c0a27e;
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
