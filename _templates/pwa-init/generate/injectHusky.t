---
to: package.json
inject: true
after: '"husky": {'
---
    "hooks": {
      "pre-commit": "lint-staged"
    }