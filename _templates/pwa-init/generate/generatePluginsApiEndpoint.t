---
to: plugins/api/endpoints.js
---
export default {
  app: {
    notifications: { method: "get", url: "notif/notifications/" },
    updateNotif: { method: "put", url: "notif/notifications/:notifId" }
  }
};
