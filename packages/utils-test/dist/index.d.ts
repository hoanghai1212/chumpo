import { RenderOptions, RenderResult } from '@testing-library/react';

type RenderWithTheme = (elm: React.ReactElement, renderOptions?: RenderOptions) => RenderResult;
declare const renderWithTheme: RenderWithTheme;

export { renderWithTheme };
