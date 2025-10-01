package CngBooking;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import javax.servlet.*;
import javax.servlet.http.*;

public class ChatServlet extends HttpServlet {
    private static final String API_KEY = "AIzaSyCESpw_SjIjMSZFmSaOll67bHy6sTgHHG4"; // put your key here
    private static final String ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain; charset=UTF-8");
        String userMessage = request.getParameter("message");
        if (userMessage == null || userMessage.isEmpty()) {
            response.getWriter().write("⚠️ Empty message.");
            return;
        }

        try {
            // Build JSON body for Gemini
            String jsonInput = "{"
                    + "\"contents\": ["
                    + "{ \"role\": \"user\", \"parts\": [ { \"text\": \"" 
                    + userMessage.replace("\"", "\\\"") + "\" } ] }"
                    + "]"
                    + "}";

            // Setup connection
            URL url = new URL(ENDPOINT);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("x-goog-api-key", API_KEY);
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonInput.getBytes(StandardCharsets.UTF_8));
            }

            // Read response
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            br.close();

            String raw = sb.toString();

            // 🔎 Extract plain text from JSON (quick + dirty parse)
            String reply = "Sorry, no reply.";
            int idx = raw.indexOf("\"text\":");
            if (idx != -1) {
                int start = raw.indexOf("\"", idx + 7) + 1;
                int end = raw.indexOf("\"", start);
                reply = raw.substring(start, end).replace("\\n", "\n");
            }

            response.getWriter().write(reply);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("⚠️ Error: " + e.getMessage());
        }
    }
}
