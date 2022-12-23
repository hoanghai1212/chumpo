import { Story } from '@storybook/react';
import { baseParameters } from 'config-storybook';

export const parameters = baseParameters;

const withThemeDecorator = (Story: Story) => <Story />;

export const decorators = [withThemeDecorator];
