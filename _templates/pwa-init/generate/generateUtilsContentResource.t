---
to: utils/contentResource.js
---
import VueContentResource from '@qoala/vue-content-resource';
import config from 'config';

export const { createPage, setValue } = new VueContentResource({
  baseURL: config.apiBaseUrl
});
