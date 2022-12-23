import { add, Button } from "ui";

export default function Web() {
  return (
    <div>
      <h1>Web</h1>
      <p>Heres a number: {add(1, 2)}</p>
      <Button />
    </div>
  );
}
