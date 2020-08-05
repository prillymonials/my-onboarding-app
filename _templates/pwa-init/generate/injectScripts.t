---
to: package.json
inject: true
before: '"init-project"'
---
    "dev": "nuxt",
    "build": "nuxt build",
    "start": "nuxt start",
    "generate": "nuxt generate",
    "build:dev": "NODE_ENV=development nuxt generate",
    "build:staging": "NODE_ENV=staging nuxt generate",
    "build:prod": "NODE_ENV=production nuxt build",
    "lint": "eslint --ext .js,.vue --ignore-path .gitignore .",
    "lintfix": "eslint --fix --ext .js,.vue --ignore-path .gitignore .",
    "precommit": "npm run lint",
    "now-dev": "npm run dev",
    "now-build": "npm run build",