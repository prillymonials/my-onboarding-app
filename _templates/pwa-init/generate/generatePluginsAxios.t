---
to: plugins/axios.js
---
export default async ({ store, $axios, app }) => {
  const CONTENT_API_URL = [
    `https://api-staging.qoala.app/api/multilanguage/v1/contents/?entry=OfflineErrorMessage&locale=id_ID`,
    `https://api-staging.qoala.app/api/multilanguage/v1/contents/?entry=OfflineErrorMessage&locale=en_ID`
  ];
  let dataError = [];

  Promise.all(
    CONTENT_API_URL.map(async url => {
      const errorMessage = await $axios.get(url);
      errorMessage.data.data.map(dats => {
        dataError.push(dats);
      });
    })
  );
  $axios.onRequest(config => {
    const dataPayload = config.data || {};
    if (dataPayload.hideLoading) {
      config.data = dataPayload.data;
      return config;
    }
    if (
      config.method === "post" ||
      config.method === "get" ||
      config.method === "put"
    ) {
      store.dispatch("apps/setLoader", true);
    }
    return config;
  });
  $axios.onRequestError(err => {
    const data = err.response.data;
    let message = {
      title: data.errorCode,
      message: data.message
    };
    store.dispatch("apps/setLoader", false);
    store.dispatch("apps/setModalMessage", true);
    store.dispatch("apps/setMessage", message);
  });
  $axios.onResponse(() => {
    store.dispatch("apps/setLoader", false);
  });
  $axios.onResponseError(err => {
    let message = {
      title: "error",
      message: err
    };
    if (err.response) {
      const data = err.response.data;
      message = {
        title: data.errorCode,
        message: data.message
      };
    }
    store.dispatch("apps/setLoader", false);
    store.dispatch("apps/setModalMessage", true);
    store.dispatch("apps/setMessage", message);
  });
  $axios.onError(async error => {
    const errorLogout = [];
    let modalMessage = true;
    if (error.response) {
      const data = error.response.data;
      const message = {
        title: "ERROR",
        message: data.message
      };
      let lang = app.i18n.locales.find(x => {
        return x.code === app.i18n.locale;
      });
      let iso = lang ? lang.iso.replace("-", "_") : "en_ID";
      try {
        const codeError = data.errorCode;
        const messageError = dataError.find(
          message =>
            message.key === codeError && message.locale.indexOf(iso) >= 0
        );
        if (messageError) message.message = messageError.value;
        if (errorLogout.indexOf(codeError) > -1) {
          store.commit("session/sessionDestroy");
          await app.$auth.logout();
        }
        modalMessage = !error.response.config.url.includes(
          "property/postalcode/detail"
        );
      } catch (error) {
        console.log(error);
      }
      store.dispatch("apps/setLoader", false);
      store.dispatch("apps/setModalMessage", modalMessage);
      store.dispatch("apps/setMessage", message);
    } else {
      console.log("error", error);
    }
  });
};
