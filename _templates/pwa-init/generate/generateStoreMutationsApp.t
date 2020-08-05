---
to: store/apps/mutations.js
---
export default {
  setLoader(state, data) {
    state.loader = data;
  },
  setMessage(state, data) {
    state.message = data;
  },
  setModalMessage(state, data) {
    state.modalMessage = data;
  }
};
