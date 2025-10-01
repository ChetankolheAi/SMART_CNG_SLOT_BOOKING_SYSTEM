<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import= "com.DbConnection.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CNG Refuel Reservation</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      color: white;
    }

    section {
      background: linear-gradient(to right, #16a34a, #3b82f6);
      padding: 80px 20px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: 1fr;
      gap: 40px;
    }

    @media(min-width: 1024px) {
      .container {
        grid-template-columns: 1fr 1fr;
        align-items: center;
      }
    }

    h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }

    h1 span {
      color: #facc15;
    }

    p {
      font-size: 18px;
      color: #d1fae5;
      margin-bottom: 30px;
      line-height: 1.6;
    }

    .buttons {
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
      margin-bottom: 40px;
    }

    .buttons button {
      padding: 15px 30px;
      font-weight: bold;
      border-radius: 10px;
      cursor: pointer;
      border: none;
      transition: all 0.3s;
    }

    .buttons .book {
      background-color: #facc15;
      color: #111827;
    }

    .buttons .book:hover {
      background-color: #fbbf24;
    }

    .buttons .stations {
      background: transparent;
      border: 2px solid white;
      color: white;
    }

    .buttons .stations:hover {
      background-color: white;
      color: #16a34a;
    }

    .features {
      display: grid;
      grid-template-columns: 1fr;
      gap: 20px;
    }

    @media(min-width: 640px) {
      .features {
        grid-template-columns: repeat(3, 1fr);
      }
    }

    .feature {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .feature-icon {
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      font-size: 16px;
    }

    .eco { background-color: #16a34a; }
    .time { background-color: #3b82f6; }
    .location { background-color: #facc15; }

    .quick-reserve {
      background-color: white;
      color: #111827;
      padding: 30px;
      border-radius: 20px;
    }

    .quick-reserve h3 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .quick-reserve label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      font-size: 14px;
    }

    .quick-reserve select,
    .quick-reserve input {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 14px;
    }

    .quick-reserve button {
      width: 100%;
      padding: 12px;
      font-weight: bold;
      background-color: #16a34a;
      color: white;
      border-radius: 10px;
      border: none;
      cursor: pointer;
      transition: background 0.3s;
    }

    .quick-reserve button:hover {
      background-color: #15803d;
    }
  </style>
</head>
<body>
  <section>
    <div class="container">
      <div>
        <h1>Reserve Your CNG <span>Refuel Slot</span></h1>
        <p>Skip the lines and guarantee your spot at CNG stations across the city. Book your refueling time in advance and drive clean with confidence.</p>
        <div class="buttons">
          <button class="book">Book Now</button>
          <button class="stations">Find Stations</button>
        </div>
        <div class="features">
          <div class="feature">
            <div class="feature-icon eco">🌿</div>
            <div>
              <p>Eco-Friendly</p>
              <p style="font-size: 12px; color:#d1fae5;">Clean Energy</p>
            </div>
          </div>
          <div class="feature">
            <div class="feature-icon time">⏰</div>
            <div>
              <p>Time Saving</p>
              <p style="font-size: 12px; color:#d1fae5;">No Waiting</p>
            </div>
          </div>
          <div class="feature">
            <div class="feature-icon location">📍</div>
            <div>
              <p>50+ Locations</p>
              <p style="font-size: 12px; color:#d1fae5;">City Wide</p>
            </div>
          </div>
        </div>
      </div>

      <div class="quick-reserve">
        <h3>Quick Reserve</h3>
        <label for="station">Select Station</label>
        <select id="station">
          <option>Choose your location</option>
          <option>Downtown CNG Hub</option>
          <option>Airport Road Station</option>
          <option>Industrial Area CNG</option>
        </select>
        <label for="time">Preferred Time</label>
        <input type="datetime-local" id="time">
        <button>Reserve Now</button>
      </div>
    </div>
  </section>
  <%@ include file="footer.html	" %>
</body>
</html>
