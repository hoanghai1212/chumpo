import nextPWA from 'next-pwa';
// @ts-check
/**
 * Run `build` or `dev` with `SKIP_ENV_VALIDATION` to skip env validation.
 * This is especially useful for Docker builds.
 */
// !process.env.SKIP_ENV_VALIDATION && (await import('./src/env/server.mjs'));

/** @type {import("next").NextConfig} */
const config = {
  experimental: {
    appDir: true,
    transpilePackages: ["ui"],
  },
  reactStrictMode: true,
  swcMinify: true,
  i18n: {
    locales: ['en'],
    defaultLocale: 'en',
  },
};

export default nextPWA({
  disable: process.env.NODE_ENV === 'development',
  dest: 'public',
})(config);
