import { create } from '@storybook/theming';
import { getVersionInfo } from 'utils-version';

export const theme = create({
  base: 'light',
  brandTitle: `Chumpo - UI ${getVersionInfo()}`,
  brandUrl: 'https://github.com/hoanghai1212/chumpo',
});
