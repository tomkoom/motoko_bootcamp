import { day1 } from "../../declarations/day1";

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  // Interact with day1 actor, calling the greet method
  const greeting = await day1.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
