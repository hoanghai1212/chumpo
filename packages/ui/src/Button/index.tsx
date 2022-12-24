import { ReactNode } from 'react';

export type ButtonProps = {
  children: ReactNode;
  onClick: () => void;
};

export const Button = ({ children, onClick }: ButtonProps) => {
  return (
    <button className="rounded-sm bg-red-200 px-1 py-2" onClick={onClick}>
      {children}
    </button>
  );
};
