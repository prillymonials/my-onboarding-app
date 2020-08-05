---
to: components/tool/ToolMessage.vue
---
<template>
  <q-modal :active="modalActive" :show-close-button="false" :fullHeight="true">
    <q-spacer bottom="lg">
      <q-text variant="ui-large" ink="muted" center>{{ modalContent ? modalContent.message : '' }}</q-text>
    </q-spacer>
    <q-button variant="primary" @click="hideModal()">Ok</q-button>
  </q-modal>
  <!-- <div>asd</div> -->
</template>

<script>
import { Modal as QModal, Text as QText, Spacer as QSpacer, Button as QButton } from '@qoala/ui';
// import axios from 'axios';

export default {
  name: 'ToolMessage',
  components: {
    QModal,
    QText,
    QButton,
    QSpacer
  },
  computed: {
    modalActive() {
      return this.$store.getters['apps/getMessageStatus'];
    },
    modalContent() {
      return this.$store.getters['apps/getModalMessage'];
    }
  },
  methods: {
    hideModal() {
      this.$store.dispatch('apps/setModalMessage', false);
    }
  }
};
</script>

<style lang="scss" scoped>
.message__desc {
  white-space: pre-wrap;
}
</style>