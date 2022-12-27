import { jestConfigNode } from 'config-jest';
import { Config } from 'jest';

const jestConfig: Config = {
  ...jestConfigNode,
  collectCoverageFrom: ['**/*.(t|j)s'],
  coverageThreshold: {
    global: {
      branches: 0,
      functions: 0,
      lines: 0,
      statements: 0,
    },
  },
};

module.exports = jestConfig;
