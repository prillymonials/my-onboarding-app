---
to: package.json
inject: true
after: '"lint-staged":{'
---
    "*.{js,ts,tsx,md,json,vue}": [
      "prettier --write",
      "git add"
    ]