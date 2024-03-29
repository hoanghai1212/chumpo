import { PrismaAdapter } from '@next-auth/prisma-adapter';
import NextAuth, { type NextAuthOptions } from 'next-auth';
// Prisma adapter for NextAuth, optional and can be removed

import { prisma } from '../../../server/db/client';

export const authOptions: NextAuthOptions = {
  // Include user.id on session
  callbacks: {
    session({ session, user }) {
      if (session.user) {
        if ('id' in session.user) {
          session.user.id = user.id;
        }
      }
      return session;
    },
  },
  // Configure one or more authentication providers
  adapter: PrismaAdapter(prisma),
  providers: [],
};

export default NextAuth(authOptions);
