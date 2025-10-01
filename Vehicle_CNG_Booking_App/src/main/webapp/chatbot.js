const chatToggle = document.getElementById("chatToggle");
const chatbot = document.getElementById("chatbot");
const closeChat = document.getElementById("closeChat");
const sendBtn = document.getElementById("sendBtn");
const chatBody = document.getElementById("chatBody");
const chatInput = document.getElementById("chatInput");

// Toggle open/close
chatToggle.onclick = () => chatbot.style.display = "flex";
closeChat.onclick = () => chatbot.style.display = "none";

// Send message
sendBtn.onclick = sendMessage;
chatInput.addEventListener("keypress", function(e) {
  if (e.key === "Enter") sendMessage();
});

function sendMessage() {
  let msg = chatInput.value.trim();
  if (!msg) return;

  // Add user msg
  appendMessage(msg, "user");
  chatInput.value = "";

  // Add typing placeholder
  let placeholder = appendMessage("…", "bot");

  // 🔥 Call backend servlet
  fetch("ChatServlet", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: "message=" + encodeURIComponent(msg)
  })
  .then(res => res.text())
  .then(reply => {
    placeholder.textContent = reply; // replace placeholder
  })
  .catch(err => {
    placeholder.textContent = "⚠️ Error: " + err.message;
  });
}

function appendMessage(text, sender) {
  let div = document.createElement("div");
  div.classList.add("msg", sender);
  div.textContent = text;
  chatBody.appendChild(div);
  chatBody.scrollTop = chatBody.scrollHeight;
  return div; // return element so we can update placeholder
}
