import { CSSProperties, ReactNode } from 'react';

import { ButtonStyled } from './styled';

export type ButtonProps = {
  children: ReactNode;

  onClick: () => void;
};

export const Button = ({ children, onClick }: ButtonProps) => {
  return <button onClick={onClick}>{children}</button>;
};
