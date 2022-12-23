export type VersionProps = {
  version: string;
};

export const Version = ({ version }: VersionProps) => {
  return <p>{version}</p>;
};
