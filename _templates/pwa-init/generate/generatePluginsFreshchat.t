---
to: plugins/freshchat.js
---
import config from 'config';

export default ({ store }) => {
  if (process.browser) {
    window.onNuxtReady(() => {
      if (store.getters['general/getUserData'] && store.getters['user/getUserToken']) {
        window.initChat(store.getters.getUserData);
      }
    });
  } else console.log('something wrong');

  function updateRestore(userData, dataFreshchat) {
    if (userData.email) {
      const datas = {
        email: userData.email,
        fullName: userData.fullName,
        phoneNumber: userData.phoneNumber,
        chattingId: dataFreshchat.restoreId,
        noRefresh: true
      };
      store.dispatch('user/updateUser', datas);
    }
  }
  window.initChat = userData => {
    if (!window.fcWidget) {
      window.fcWidget = '';
      return false;
    }
    if (userData.chattingId) {
      window.fcWidget.init({
        token: config.freshCatToken,
        host: 'https://wchat.freshchat.com',
        externalId: userData.email,
        restoreId: userData.chattingId,
        firstName: userData.fullName,
        phone: userData.phoneNumber,
        email: userData.email,
        open: false,
        config: {
          headerProperty: {
            hideChatButton: true
          },
          content: {
            data: {
              reply_field: 'reply field'
            },
            placeholders: {
              search_field: 'Search',
              reply_field: 'Reply',
              csat_reply: 'Add your comments here'
            }
          },
          hideFAQ: true
        }
      });
    } else {
      window.fcWidget.init({
        token: config.freshCatToken,
        host: 'https://wchat.freshchat.com',
        externalId: userData.email,
        firstName: userData.fullName,
        phone: userData.phoneNumber,
        email: userData.email,
        open: true,
        config: {
          headerProperty: {
            hideChatButton: true
          },
          content: {
            placeholders: {
              search_field: 'Search',
              reply_field: 'Reply',
              csat_reply: 'Add your comments here'
            }
          },
          hideFAQ: true
        }
      });
    }
    window.fcWidget.user.get().then(
      result => {
        const userInfo = result.data;
        updateRestore(userData, userInfo);
        // Do Something
      },
      error => {
        if (error.status === 401) {
          window.fcWidget.user.create().then(
            response => {
              updateRestore(userData, response.data);
            },
            errorCreate => {
              console.log(errorCreate);
            }
          );
        } else {
          console.log(error);
        }
      }
    );
    return true;
  };

  return true;
};