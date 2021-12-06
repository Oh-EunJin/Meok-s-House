<template>
  <b-container class="bv-example-row mt-3">
    <write-form type="modify" />
  </b-container>
</template>

<script>
import WriteForm from "@/components/talk/include/WriteForm.vue";

export default {
  name: "talkmodify",
  components: {
    WriteForm,
  },
};
</script>
