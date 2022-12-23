import { ReactNode } from 'react';

type ButtonProps = {
    children: ReactNode;
    onClick: () => void;
};
declare const Button: ({ children, onClick }: ButtonProps) => JSX.Element;

type VersionProps = {
    version: string;
};
declare const Version: ({ version }: VersionProps) => JSX.Element;

export { Button, ButtonProps, Version, VersionProps };
