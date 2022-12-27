/** @type {import("eslint").Linter.Config} */
module.exports = {
  parserOptions: {
    project: 'tsconfig.json',
    tsconfigRootDir: __dirname,
    sourceType: 'module',
  },

  root: true,
  env: {
    node: true,
    jest: true,
  },
  ignorePatterns: ['.eslintrc.js', 'app.module.ts'],

  extends: ['eslint-config-base'],

  rules: {
    'jest/valid-title': 'off',
  },
};
