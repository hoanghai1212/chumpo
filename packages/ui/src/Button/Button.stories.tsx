import { action } from '@storybook/addon-actions';
import { Meta, Story } from '@storybook/react';

import { Button, ButtonProps } from '.';

export default {
  component: Button,
  title: 'Button',
} as Meta;

const base: ButtonProps = {
  children: 'Click Me',
  onClick: action('onClick'),
};

const Template: Story<ButtonProps> = (args) => <Button {...base} {...args} />;

export const Default = Template.bind({});
Default.args = base;

export const LongText = Template.bind({});
const LongTextArgs: ButtonProps = {
  ...base,
  children: 'Really Looooong Text',
};
LongText.args = LongTextArgs;
