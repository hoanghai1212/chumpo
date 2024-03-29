/** @type {import("eslint").Linter.Config} */

module.exports = {
  root: true,

  parserOptions: {
    tsconfigRootDir: __dirname,
    project: ['./tsconfig.json'],
  },

  extends: ['next', 'eslint-config-base'],
};
