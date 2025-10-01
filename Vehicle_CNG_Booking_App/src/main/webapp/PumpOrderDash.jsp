<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #0d1117;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
    }

    .profile-container {
      background: #111827;
      padding: 30px;
      border-radius: 12px;
      width: 95%;
      max-width: 1200px;
      margin-top: 100px;
      margin-bottom: 140px;
      box-shadow: 0 0 30px rgba(0, 255, 0, 0.15);
    }

    h2 {
      text-align: center;
      color: #ffffff;
      text-shadow: 0 0 10px #00ff66;
      margin-bottom: 20px;
    }

    /* Header Section */
    .profile-header {
      display: flex;
      align-items: center;
      gap: 25px;
      margin-bottom: 30px;
    }

    .profile-pic {
      width: 130px;
      height: 130px;
      border-radius: 50%;
      background: url('https://via.placeholder.com/130') no-repeat center center/cover;
      border: 3px solid #00ff66;
      box-shadow: 0 0 15px #00ff66;
    }

    .profile-info h3 {
      margin: 0;
      color: #00ff99;
    }

    .profile-info p {
      margin: 6px 0;
      font-size: 15px;
      color: #aaa;
    }

    /* Stats Section */
    .stats {
      display: flex;
      gap: 20px;
      margin: 20px 0;
    }

    .stat-box {
      flex: 1;
      background: #1f2937;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 0 12px rgba(0, 255, 100, 0.2);
    }

    .stat-box h3 {
      margin: 0;
      color: #00ff66;
      font-size: 24px;
    }

    .stat-box p {
      margin: 5px 0 0;
      font-size: 14px;
      color: #bbb;
    }

    /* Table Section */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 25px;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 0 12px rgba(0, 255, 100, 0.2);
    }

    table thead {
      background: #00ff66;
      color: #111;
    }

    table th, table td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #333;
    }

    table tr:nth-child(even) {
      background: #1f2937;
    }


    table tr:hover {
      background: rgba(0, 255, 100, 0.1);
    }

    .btn {
      background: #00ff66;
      color: #111;
      border: none;
      padding: 8px 16px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
      box-shadow: 0 0 12px #00ff66;
      transition: 0.3s;
    }

    .btn:hover {
      background: #00cc55;
    }
    .main{
        display: flex;
        height: 100%;
        width: 100%;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .filter-box {
  text-align: center;
  margin: 30px auto;
  padding: 20px;
  background: #0d1117;
  border-radius: 12px;
  box-shadow: 0px 0px 20px rgba(0, 255, 100, 0.2);
  width: fit-content;
}

.filter-box h2 {
  color: #00ff88;
  text-shadow: 0 0 10px #00ff88, 0 0 20px #00ff88;
  margin-bottom: 20px;
}

.filter-form {
  display: flex;
  align-items: center;
  gap: 15px;
  justify-content: center;
  flex-wrap: wrap;
}

.filter-form label {
  color: #fff;
  font-weight: 500;
}

.filter-form select {
  padding: 8px 12px;
  border-radius: 8px;
  border: none;
  background: #1a1f29;
  color: #00ff88;
  font-size: 14px;
  box-shadow: 0 0 10px rgba(0, 255, 100, 0.3);
  cursor: pointer;
}

.filter-form select:focus {
  outline: none;
  box-shadow: 0 0 15px #00ff88;
}

.btn-glow {
  padding: 10px 20px;
  border: none;
  border-radius: 10px;
  font-size: 15px;
  font-weight: bold;
  background: #00ff88;
  color: #000;
  cursor: pointer;
  box-shadow: 0 0 15px #00ff88;
  transition: all 0.3s ease-in-out;
}

.btn-glow:hover {
  background: #00cc66;
  box-shadow: 0 0 25px #00ff88, 0 0 50px #00ff88;
}
    
  </style>
</head>
<body>
 <header id="navbar"></header>
      <div class="main">
  <div class="profile-container">
    <h2></h2>
<h2>Bookings (Month & Year Wise)</h2>
    <table>
      <thead>
        <tr>
           <th>Booking ID</th>
	      <th>Customer Name</th>
	      <th>Customer Phone</th>
	      <th>Date</th>
	      <th>Slot</th>
	      <th>Vehicle Type</th>
	      <th>Vehicle No</th>
        </tr>
      </thead>
      <tbody>
   <%
        List<String[]> orders = (List<String[]>) request.getAttribute("orders");
        if (orders != null && !orders.isEmpty()) {
            for (String[] row : orders) {
    %>
    <tr>
        <td><%= row[0] %></td>
        <td><%= row[1] %></td>
        <td><%= row[2] %></td>
        <td><%= row[3] %></td>
        <td><%= row[4] %></td>
        <td><%= row[5] %></td>
        <td><%= row[6] %></td>
        <td><%= row.length > 7 ? row[7] : "" %></td>
    </tr>
    <%      }
        } else { %>
    <tr>
        <td colspan="8">No bookings found for this pump.</td>
    </tr>
    <% } %>
  </tbody>
</table>
  </div>
    <footer id="footer"></footer>
</div>
  <script>
    // Load navbar and footer dynamically
    fetch("navbar.jsp").then(res => res.text()).then(data => {
      document.getElementById("navbar").innerHTML = data;
    });
    fetch("footer.html").then(res => res.text()).then(data => {
      document.getElementById("footer").innerHTML = data;
    });

    // Example JS for removing card (client-side only)
    document.addEventListener("click", function(e){
      if(e.target.closest(".remove-btn")){
        e.target.closest(".pump-card").remove();
      }
    });
  </script>
</body>
</html>