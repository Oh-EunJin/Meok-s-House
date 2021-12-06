<template>
  <div id="viewpage">
    <notice-write-form type="modify" />
  </div>
</template>

<script>
import NoticeWriteForm from "./child/NoticeWriteForm.vue";

export default {
  name: "NoticeModify",
  components: {
    NoticeWriteForm,
  },
};
</script>

<style></style>
