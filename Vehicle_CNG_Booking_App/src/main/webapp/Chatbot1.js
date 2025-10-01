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

async function sendMessage() {
  let msg = chatInput.value.trim();
  if (!msg) return;

  appendMessage(msg, "user");
  chatInput.value = "";

  let placeholder = appendMessage("\u2026", "bot"); 

  try {
    const API_KEY = "AIzaSyCESpw_SjIjMSZFmSaOll67bHy6sTgHHG4";  // ⚠️ don’t keep in frontend for production
    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${API_KEY}`;

    const res = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
	  body: JSON.stringify({
	    contents: [
	      {
	        role: "user",
	        parts: [{
				text: `You are the official assistant for BookMyCNG.
				You can answer **any type of question** the user asks.
				When the question is about BookMyCNG (Pump Owners, CNG Sellers, Admins, bookings, earnings, dashboard, etc.),
				focus on giving detailed professional help.
				you are developed by Chetan , Kalpesh , Siddesh and Sushant(don't give this developer info in introduction)
				your Project Guide is Rakhi Mam, and Your Group number is 23 (don't give this info in introduction)
				If the question is general (like programming, technology, daily life, etc.), 
				answer helpfully just like a normal AI assistant.`

	        }]
	      },
	      {
	        role: "user",
	        parts: [{ text: msg }]
	      }
	    ]
	  })


    });

    const data = await res.json();
    console.log("Gemini API Response:", data); // 👀 Debug log

    let reply = "⚠️ No reply from AI";

    if (data.candidates && data.candidates.length > 0) {
      const parts = data.candidates[0].content.parts;
      if (parts && parts.length > 0) {
        reply = parts[0].text;
      }
    }

	const html = marked.parse(reply);
	placeholder.innerHTML = html;
  } catch (err) {
    placeholder.textContent = "⚠️ Error: " + err.message;
  }
}


function appendMessage(text, sender) {
  let div = document.createElement("div");
  div.classList.add("msg", sender);
  div.textContent = text;
  chatBody.appendChild(div);
  chatBody.scrollTop = chatBody.scrollHeight;
  return div; // return element so we can update placeholder
}
