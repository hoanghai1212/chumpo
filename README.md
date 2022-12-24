## What's inside?

This turborepo uses [npm](https://www.npmjs.com) as a package manager. It includes the following packages/apps:

### Apps and Packages

- `chum-chum`: a [Next.js](https://nextjs.org/) app
- `ui`: a stub React component library shared by applications
- `config-eslint`: `eslint` configurations
- `config-jest`: `jest` configurations
- `config-storybook`: `storybook` configurations
- `config-tsconfig`: `tsconfig.json`s used throughout the monorepo
- `database`: a `Prisma` client and schema
- `utils-test`: a stub test utility library
- `utils-version`: a stub version utility library

Each package/app is 99.99% [TypeScript](https://www.typescriptlang.org/).

### Utilities

- [TypeScript](https://www.typescriptlang.org/) for static type checking
- [ESLint](https://eslint.org/) for code linting
- [Prettier](https://prettier.io) for code formatting
- [Husky](https://typicode.github.io/husky/#/) for Git hooks
  - fix if husky not working: `chmod ug+x .husky/*` `chmod ug+x .git/hooks/*`

### Build

To build all apps and packages, run the following command:

```
cd chumpo
npm run build
```

### Develop

To develop all apps and packages, run the following command:

```
cd chumpo
npm run dev
```

### Remote Caching

Turborepo can use a technique known as [Remote Caching](https://turbo.build/repo/docs/core-concepts/remote-caching) to share cache artifacts across machines, enabling you to share build caches with your team and CI/CD pipelines.

By default, Turborepo will cache locally. To enable Remote Caching you will need an account with Vercel. If you don't have an account you can [create one](https://vercel.com/signup), then enter the following commands:

```
cd chumpo
npm dlx turbo login
```

This will authenticate the Turborepo CLI with your [Vercel account](https://vercel.com/docs/concepts/personal-accounts/overview).

Next, you can link your Turborepo to your Remote Cache by running the following command from the root of your turborepo:

```
npm dlx turbo link
```

## Useful Links

Learn more about the power of Turborepo:

- [Pipelines](https://turbo.build/repo/docs/core-concepts/monorepos/running-tasks)
- [Caching](https://turbo.build/repo/docs/core-concepts/caching)
- [Remote Caching](https://turbo.build/repo/docs/core-concepts/remote-caching)
- [Filtering](https://turbo.build/repo/docs/core-concepts/monorepos/filtering)
- [Configuration Options](https://turbo.build/repo/docs/reference/configuration)
- [CLI Usage](https://turbo.build/repo/docs/reference/command-line-reference)
