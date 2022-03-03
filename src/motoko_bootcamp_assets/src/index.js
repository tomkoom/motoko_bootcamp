import { motoko_bootcamp } from "../../declarations/motoko_bootcamp";

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  // Interact with motoko_bootcamp actor, calling the greet method
  const greeting = await motoko_bootcamp.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
