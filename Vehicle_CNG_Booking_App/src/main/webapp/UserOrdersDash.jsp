<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%
    // Get user info from session (set during login)
    String userName = (String) session.getAttribute("name");
    String userEmail = (String) session.getAttribute("email");
    String userPhone = (String) session.getAttribute("mobile");
    String userCity  = (String) session.getAttribute("city"); // only if stored
    String memberSince = (String) session.getAttribute("memberSince"); // optional

   
%>
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
      width: 900px;
      margin-top: 100px;

    }

    h2 {
      text-align: center;
      color: #ffffff;
      text-shadow: 0 0 10px #00ff66;
      margin-bottom: 20px;
    }

    /* Profile Info Section */
    .profile-header {
      display: flex;
      align-items: center;
      gap: 20px;
      margin-bottom: 30px;
    }

    .profile-pic {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: url('https://via.placeholder.com/120') no-repeat center center/cover;
      border: 3px solid #00ff66;
      box-shadow: 0 0 15px #00ff66;
    }

    .profile-info {
      flex: 1;
    }

    .profile-info h3 {
      margin: 0;
      color: #00ff99;
    }

    .profile-info p {
      margin: 5px 0;
      font-size: 15px;
      color: #aaa;
    }
    
    /* Table Section */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
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
    
    /* table tr:nth-child(1) {
        background: #005eff;
    } */
    
    /* table tr:nth-child(odd) {
        background: #161d29;
    } */
    table tr{
        
        background: rgba(0, 255, 100, 0.1);
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
        flex-direction: column;
        width: 100%;
        justify-content: center;
        align-items: center;
        margin-top:30px;
     
    }
  </style>
</head>
<html>
<body>
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
  <header id="navbar"></header>
  <div class="main">
  
  
    <div class="profile-container">
    <h2></h2>
<h2>Previous Bookings</h2>
			    <table>
			      <thead>
			        <tr>
			          <th>ID</th>
			           <th>Station</th>
			           <th>Date</th>
			           <th>Slot</th>
			           <th>Vehicle Type</th>
			           <th>Vehicle No</th>
			  
			           <th>Receipt</th>
			        </tr>
			      </thead>
			      <tbody>
    <!-- Booking History Table -->

       <%
            List<String[]> orders = (List<String[]>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
            	%>
            	
            	<%
            	
        
                for (String[] row : orders) {
        %>
        <tr>
          	<td><%= row[0] %></td>
            <td><%= row[1] %></td>
            <td><%= row[2] %></td>
            <td><%= row[3] %></td>
            <td><%= row[4] %></td>
            <td><%= row[5] %></td>
       
          <td><button class="btn">Download</button></td>
        </tr>
        <%      }
            } else { %>
        <tr>
            <td colspan="7"></td>
        </tr>
        <% } %>
      </tbody>
    </table>
      
    
	</div>
	<footer id="footer"></footer>
  
  
  </div>

</body>

</html>