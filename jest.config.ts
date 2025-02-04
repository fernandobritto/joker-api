export default {
  clearMocks: true,
  testEnvironment: 'node',
  testMatch: ['<rootDir>/tests/**/*.spec.ts'],
  moduleNameMapper: {
    '@bootstrap/(.*)': '<rootDir>/src/bootstrap/$1',
    '@patterns/(.*)': '<rootDir>/src/patterns/$1',
    '@resources/(.*)': '<rootDir>/src/resources/$1',
    '@tests/(.*)': '<rootDir>/tests/$1'
  },
  collectCoverageFrom: ['<rootDir>/src/**/*.ts'],
  coveragePathIgnorePatterns: ['<rootDir>/src/bootstrap/', '<rootDir>/app/'],
  testPathIgnorePatterns: ['/node_modules/'],
  coverageThreshold: {
    global: {
      statements: 40,
      branches: 40,
      lines: 40
    }
  },
  transform: {
    '^.+\\.(t|j)s?$': '@swc/jest'
  }
}
