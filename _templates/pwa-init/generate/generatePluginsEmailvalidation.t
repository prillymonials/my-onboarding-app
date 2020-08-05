---
to: plugins/emailvalidation.js
---
function emailIsValid(app) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(app);
}

// eslint-disable-next-line no-unused-vars
export default ({ app }, inject) => {
  inject("emailValid", (string) => emailIsValid(string));
};
