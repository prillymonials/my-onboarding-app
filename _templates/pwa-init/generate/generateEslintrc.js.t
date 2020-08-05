---
to: .eslintrc.js
---
module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
    browser: true
  },
  extends: ['eslint:recommended', 'plugin:jest/recommended', 'plugin:vue/essential'],
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 2017,
    sourceType: 'module'
  },
  plugins: ['jest', 'vue'],
  rules: {
    'object-curly-newline': 'off',
    'import/prefer-default-export': 'off',
    'no-var': 'error',
    'no-new-object': 'error',
    'object-shorthand': 'error',
    'generator-star-spacing': [
      'error',
      {
        before: true,
        after: false
      }
    ],
    'no-multi-assign': 'error',
    eqeqeq: 'error',
    'no-nested-ternary': 'error',
    'no-unneeded-ternary': 'error',
    'no-mixed-operators': 'error',
    'newline-per-chained-call': [
      'error',
      {
        ignoreChainWithDepth: 2
      }
    ],
    'padded-blocks': ['error', 'never'],
    'space-in-parens': 'error',
    'array-bracket-spacing': 'error',
    'object-curly-spacing': 'off',
    'max-len': 'off',
    'comma-style': 'error',
    'quote-props': ['error', 'as-needed'],
    'space-before-blocks': 'error',
    'keyword-spacing': 'error',
    'space-infix-ops': 'error',
    'no-console': 'off',
    indent: 'off',

    quotes: ['off', 'single'],
    semi: ['error', 'always'],
    'jest/no-disabled-tests': 'warn',
    'jest/no-focused-tests': 'error',
    'jest/no-identical-title': 'error',
    'jest/prefer-to-have-length': 'warn',
    'jest/valid-expect': 'error',
    'comma-dangle': ['error', 'never'],
    'linebreak-style': 'off',
    'function-paren-newline': 'off',
    'arrow-parens': 'off',

    'no-return-await': 0,
    'no-underscore-dangle': 'off',
    'no-await-in-loop': 'off',
    'no-plusplus': 'off',
    'no-param-reassign': 'off',
    'no-restricted-syntax': 'off',
    'react/no-this-in-sfc': 'off',
    'vue/component-name-in-template-casing': 'off'
  }
};
