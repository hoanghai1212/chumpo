import { type inferAsyncReturnType } from '@trpc/server';
import { type CreateNextContextOptions } from '@trpc/server/adapters/next';
import { type Session } from 'next-auth';

import { getServerAuthSession } from 'server/common/get-server-auth-session';
import { prisma } from 'server/db/client';

type CreateContextOptions = {
  session: Session | null;
};

/** Use this helper for:
 * - testing, so we dont have to mock Next.js' req/res
 * - trpc's `createSSGHelpers` where we don't have req/res
 * @see https://create.t3.gg/en/usage/trpc#-servertrpccontextts
 **/
export const createContextInner = async (opts: CreateContextOptions) => {
  return Promise.resolve({
    session: opts.session,
    // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
    prisma,
  });
};

/**
 * This is the actual context you'll use in your router
 * @link https://trpc.io/docs/context
 **/
export const createContext = async (opts: CreateNextContextOptions) => {
  const { req, res } = opts;

  // Get the session from the server using the unstable_getServerSession wrapper function
  // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment, @typescript-eslint/no-unsafe-call
  const session = await getServerAuthSession({ req, res });

  return await createContextInner({
    // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
    session,
  });
};

export type Context = inferAsyncReturnType<typeof createContext>;
