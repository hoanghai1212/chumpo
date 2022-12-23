import { render, RenderOptions, RenderResult } from '@testing-library/react';

type RenderWithTheme = (elm: React.ReactElement, renderOptions?: RenderOptions) => RenderResult;

export const renderWithTheme: RenderWithTheme = (component, renderOptions?) => {
  return render(component, renderOptions);
};
