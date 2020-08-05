---
to: src/m2/index.vue
---
<template>
  <general-template>
    <q-padder horizontal="xs" vertical="xs">
      <div class="full-page">
        <img src="https://qoala.app/_nuxt/img/ab06c6e.png" />
        <q-text variant="formal" ink bold>Menu 2</q-text>
      </div>
    </q-padder>
  </general-template>
</template>

<script>
import { Padder as QPadder, Text as QText } from "@qoala/ui";
import GeneralTemplate from "~/components/General/GeneralTemplate";
export default {
  components: {
    QPadder,
    QText,
    GeneralTemplate
  },
  methods: {},
  created() {}
};
</script>

<style lang="scss" scoped>
.full-page {
  max-width: 480px;
  margin: 0 auto;
  height: 100%;
  background: #ffffff;
  min-height: 100vh;
  text-align: center;
}
</style>
