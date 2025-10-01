
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
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CNG Reservation - User Profile</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", Tahoma, sans-serif;
    }

    body {
      background: #0d1b1e; /* dark background */
      color: #e5e7eb; /* light text */

     
    }

    .profile-header {
      background: #062925; /* blackish green */
      color: white;
      border-radius: 12px 12px 0 0;
      padding: 25px;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0,0,0,0.4);
      width: 100%;
      margin-top:100px;
       display: flex;
      flex-direction: row;
    }
	  .member {
      
    }

    .member img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
      border: 3px solid #10b981;
      object-fit: cover;
      margin-right: 20px;
    }
    .profile-header h2 {
      margin-bottom: 5px;
      text-align: left;
    }

    .profile-header p {
      margin-bottom: 10px;
      font-size: 14px;
      color: #9ae6b4;
          text-align: left;
    }

    .badges {
      margin-bottom: 15px;
      text-align: left;
    }

    .badge {
      display: inline-block;
      padding: 4px 12px;
      font-size: 12px;
      border-radius: 20px;
      margin: 0 0px;
      background: #064e3b; /* deep green */
      color: #a7f3d0;
    }

    .stats1 {
      display: flex;
      justify-content: space-around;
      background: #111827;
      color: #f9fafb;
      padding: 15px 0;
      border-radius: 0 0 12px 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.5);
       width: 100%;
    }

    .stat {
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .stat h3 {
      font-size: 20px;
      margin-bottom: 5px;
      color: #34d399;
    }

    .card {
      background: #1f2937;
      border-radius: 12px;
      margin-top: 25px;
      padding: 20px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.5);
       width: 100%;
    }

    .card h3 {
      margin-bottom: 10px;
      color: #f3f4f6;
    }

    .card p {
      color: #9ca3af;
      font-size: 14px;
    }

    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
      margin-top: 15px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
    }

    .form-group label {
      font-size: 13px;
      color: #d1d5db;
      margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      padding: 10px;
      border: 1px solid #374151;
      border-radius: 6px;
      font-size: 14px;
      background: #111827;
      color: #f9fafb;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
      border-color: #10b981;
      outline: none;
    }

    textarea {
      resize: none;
      grid-column: span 2;
      min-height: 60px;
    }

    .form-actions {
      display: flex;
      justify-content: flex-start;
      gap: 15px;
      margin-top: 20px;
    }

    .btn {
      padding: 10px 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 14px;
      font-weight: bold;
      transition: 0.3s;
    }

    .btn-primary {
      background: #10b981;
      color: #fff;
    }

    .btn-primary:hover {
      background: #059669;
    }

    .btn-secondary {
      background: #374151;
      color: #e5e7eb;
    }

    .btn-secondary:hover {
      background: #4b5563;
    }

    .btn-cancel {
      background: #6b7280;
      color: #f9fafb;
    }

    .btn-cancel:hover {
      background: #9ca3af;
    }

    .footer-info {
      font-size: 12px;
      color: #9ca3af;
      display: flex;
      justify-content: space-between;
      margin-top: 15px;
      border-top: 1px solid #374151;
      padding-top: 8px;
    }
    .main11{
 display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 900px;
    }
    .Main111{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 100%;

    }
    .form-actions button{
    width:100%;
    }
    .form-actions{
    display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .btn a{
       margin-top: 10px;
      text-decoration: none;
      color: white;
  </style>
</head>
<body>
  <header id="navbar"></header>
  <div class="Main111">
  <div class="main11">
  <!-- Profile Header -->
  <div class="profile-header">
  	<div class="member">
          <img src="data:image/png;base64,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" alt="Team Member">
    </div>
    <div class="content">
    <h2><%= userName %></h2>
    <p><%= userEmail %></p>
	    <div class="badges">
	      <span class="badge">Premium Member</span>
	      <span class="badge">Active</span>
	      
	    </div>
    </div>
  </div>

  <!-- Stats -->
  <div class="stats1">
    <div class="stat">
      <h3>12</h3>
      <p>Reservations</p>
    </div>
    <div class="stat">
            <button class="btn "><a href="UserOrders">View My Bookings</a></button>
    </div>
    <div class="stat">
      <h3>4</h3>
      <p>Upcoming</p>
    </div>
  </div>

  <!-- Personal Info -->
  <div class="card">
    <h3>Personal Information</h3>
    <p>Update your profile details and vehicle information</p>

    <form>
      <div class="form-grid">
        <div class="form-group">
          <label>Full Name</label>
          <input type="text" value="<%= userName %>">
        </div>
        <div class="form-group">
          <label>Email Address</label>
          <input type="email" value="<%= userEmail %>">
        </div>
        <div class="form-group">
          <label>Phone Number</label>
          <input type="tel" value="+91<%= userPhone %>">
        </div>
        <div class="form-group">
          <label>City</label>
          <input type="text" value="<%= userCity != null ? userCity : "N/A" %>">
        </div>
        <div class="form-group">
          <label>Vehicle Type</label>
          <select disabled>
            <option>Car</option>
            <option>Bus</option>
            <option>Rickshaw</option>
          </select>
        </div>
        <div class="form-group">
          <label>CNG Kit Number</label>
          <input type="text" value="CNG-123456" disabled>
        </div>
        <div class="form-group" style="grid-column: span 2;" >
          <label>Address</label>
          <textarea disabled>123 Main Street, Downtown, New York, NY 10001</textarea>
        </div>
      </div>

      <div class="form-actions">
      	<button class="btn">Save Changes</button>
        
        
      </div>
    </form>
  
    <div class="footer-info">
      <span>Account created: January 15, 2024</span>
      <span>Last updated: March 21, 2024</span>
    </div>
  </div>
  	
  
</div>
<footer id="footer"></footer>
<script>
    // Load navbar and footer dynamically
    fetch("navbar.jsp").then(res => res.text()).then(data => {
      document.getElementById("navbar").innerHTML = data;
    });
    fetch("footer.html").then(res => res.text()).then(data => {
      document.getElementById("footer").innerHTML = data;
    });

    
  </script>
  	
</body>
</html>
