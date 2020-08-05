---
to: store/apps/getters.js
---
export default {
  getLoadingStatus(state) {
    return state.loader;
  },
  getModalMessage(state) {
    return state.message;
  },
  getMessageStatus(state) {
    return state.modalMessage;
  }
};
