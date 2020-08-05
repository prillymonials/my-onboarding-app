---
to: store/apps/actions.js
---
export default {
  setLoader(context, payload) {
    context.commit("setLoader", payload);
  },
  setModalMessage(context, payload) {
    context.commit("setModalMessage", payload);
  },
  setMessage(context, payload) {
    context.commit("setMessage", payload);
  }
};
