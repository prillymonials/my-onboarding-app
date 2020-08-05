---
to: components/General/GeneralNavigation.vue
---
<template>
  <div class="navigation-container">
    <Grid :column="4" class="navigation-inner-container">
      <div
        v-for="navItem in navItems"
        :key="navItem.path"
        class="navbar-item"
      >
        <nuxt-link :to="`${navItem.path}`">
          <Spacer bottom="xxs">
            <navigation
              :name="navItem.id"
              :active="activePath === navItem.id ? true : false"
              :notif="unreaded"
            />
          </Spacer>
          <WebText :ink="activePath === navItem.id ? 'label' : 'grayscale'" variant="ui-tiny" bold>
            {{ navItem.label }}
          </WebText>
        </nuxt-link>
      </div>
    </Grid>
  </div>
</template>

<script>
/* eslint-disable vue/no-unused-components */
import { Text as WebText, Grid, Spacer, Padder } from "@qoala/ui";
import Navigation from '@/assets/icons/Navigation';

export default {
  name: "GeneralNavigation",
  components: {
    WebText,
    Grid,
    Spacer,
    Padder,
    Navigation
  },
  props: {
    activeMenu: {
      type: Boolean,
      default: false
    },
    content: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      notif: false
    };
  },

  computed: {
    navItems() {
      return [
        {
          id: "home",
          path: "/",
          label: "home"
        },
        {
          id: "m1",
          path: "m1",
          label: "Menu 1"
        },
        {
          id: "m2",
          path: "m2",
          label: "Menu 2"
        },
        {
          id: "m3",
          path: "m3",
          label: "Menu 3"
        }
      ];
    },
    unreaded() {
      return this.notif;
    },
    activePath() {
      const validRoutes = ["home", "m1", "m2", "m3"];
      const routeArr = this.$route.path.split("/").filter(Boolean);
      if (routeArr.length === 0) {
        return "home";
      }
      return validRoutes.find(route => {
        const result = [];
        routeArr.forEach(r => {
          if (r.indexOf(route) !== -1) {
            result.push(r);
          }
        });
        return Boolean(result.length);
      });
    }
  },
  methods: {}
};
</script>

<style scoped>
.navigation-container {
  height: 56px;
  width: 100%;
  z-index: 99;
  bottom: 0;
  overflow: hidden;
  position: fixed;
  background-color: #fff;
  -webkit-transition: all ease 0.5s; /* For Safari 3.1 to 6.0 */
  transition: all ease 0.5s;
  border-top: 0.5px solid #e2e2e2;
}

.navigation-inner-container {
  margin: 0 auto;
  width: 100%;
  max-width: 480px;
  align-items: center;
  text-align: center;
  height: 100%;
}

.nav-icon {
  height: 32px;
  object-fit: contain;
}

.navbar-item {
  cursor: pointer;
}
.navbar-item a {
  text-decoration: none;
}
</style>
