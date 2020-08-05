---
to: nuxt.config.js
---
const fs = require('fs');
const config = require('config');
const path = require('path');

fs.writeFileSync(path.resolve(__dirname, './shared/client.json'), JSON.stringify(config));
export default {
  mode: 'spa',
  /*
   ** Headers of the page
   */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || ''
      }
    ],
    link: [{ rel: 'shortcut icon', type: 'image/png', href: 'https://qoala.app/_nuxt/img/ab06c6e.png' }]
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },
  /*
   ** Global CSS
   */
  css: ['~/assets/main.scss', '@qoala/ui/eucalyptus.css'],
  /*
   ** Plugins to load before mounting the App
   */
  env: {
    VERSION: process.env.npm_package_version,
    NAME: process.env.npm_package_name,
    NODE_ENV: process.env.NODE_ENV,
    API_BASE_URL: config.get('apiBaseUrl'),
    FRESHCAT_TOKEN: config.get('freshCatToken'),
    STACKDRIVER_KEY: config.get('stackDriverKey'),
    GOOGLE_PROJECT_ID: config.get('googleProjectId')
  },
  plugins: [
    // sectionPlugins
  ],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [
    [
      '@nuxt/typescript-build',
      {
        typeCheck: true,
        ignoreNotFoundWarnings: true
      }
    ]
  ],
  /*
   ** Nuxt.js modules
   */
  modules: [
    "@nuxtjs/workbox",
    [
      "@nuxtjs/axios",
      {
        baseURL: config.get("apiBaseUrl")
      }
    ],
    [
      "@nuxtjs/moment",
      {
        locales: ["id"],
        plugin: true
      }
    ]
  ],
  /*
   ** Build configuration
   */
  build: {
    /*
     ** Run ESLint on save
     */
    // TS, somehow typeCheck will run into memory leak, need to find out how to use ForkTsChecker out of @nuxt/typescript
    typescript: {
      typeCheck: false
    },
    transpile: ['@qoala/ui'],
    extend(config, { isDev, isClient }) {
      config.resolve.alias.config = path.resolve(__dirname, './shared/client.json');
      config.module.rules.push({
        test: /\.(csv|xlsx|xls|pdf)$/,
        loader: 'file-loader',
        options: {
          name: 'files/[name].[ext]'
        }
      });
      if (isDev && process.client) {
        config.module.rules.push(
          {
            test: /\.js$/,
            loader: 'babel-loader',
            exclude: /(node_modules)/
          },
          {
            test: /\.svg$/,
            include: /assets\/svg/,
            use: [
              {
                loader: 'html-loader'
              }
            ]
          }
        );
      }
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        });
      }
      // config.target = "async-node";
      const vueLoader = config.module.rules.find(rule => rule.loader === 'vue-loader');
      vueLoader.options.transformAssetUrls = {
        img: 'src',
        image: 'xlink:href'
      };
    }
    // terser: false
    // analyze: true
  }
};
