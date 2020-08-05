---
to: plugins/general.js
---
export default () => {
  // remove console log in production
  if (process.env.NODE_ENV && process.env.NODE_ENV.toLowerCase() === 'production') {
    console.log = () => {
      console.warn('Please check on https://www.qoala.id/karir-qoala/');
    };
  }
  window.goHome = false;
  window.isAndroid = typeof qoala !== 'undefined';
  window.isApple = false;
  window.setupWebViewJavascriptBridge = callback => {
    if (window.WebViewJavascriptBridge) {
      // eslint-disable-next-line
      return callback(WebViewJavascriptBridge);
    }
    if (window.WVJBCallbacks) {
      return window.WVJBCallbacks.push(callback);
    }
    window.WVJBCallbacks = [callback];
    const WVJBIframe = document.createElement('iframe');
    WVJBIframe.style.display = 'none';
    WVJBIframe.src = 'https://__bridge_loaded__';
    document.documentElement.appendChild(WVJBIframe);
    setTimeout(() => {
      document.documentElement.removeChild(WVJBIframe);
    }, 0);
    return true;
  };

  // check ios natively
  if (!window.isAndroid) {
    window.setupWebViewJavascriptBridge(bridge => {
      bridge.registerHandler('appleIsNative', () => {
        window.isApple = true;
      });
      bridge.callHandler('appleIsNative', {}, () => {
        window.isApple = true;
      });
    });
  }
};
