    <%@ page import="io.jsonwebtoken.Claims" %>
<%@ page import="io.jsonwebtoken.JwtException" %>
<%@ page import="CngBooking.JWTUtils" %>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: "Segoe UI", sans-serif;
}

body {
  background: #0d1117;
  color: #e6e6e6;
}


/* .navbar {
    background: #277dfe00;
  color: #fff;
  padding: 1px 0;
  position: sticky;
  top: 0;
  z-index: 1000;
  display: flex;
  justify-content: center;
} */

.container {

  margin: auto;
  padding: 0 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}

.container .logo {
  font-size: 20px;
  font-weight: bold;
  color: #ffffff;
}

.nav-links ul {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
}

.nav-links li {
  margin-left: 20px;
}

.nav-links a {
  color: #bbb;
  text-decoration: none;
  font-size: 16px;
  transition: color 0.3s;
}

.nav-links a:hover {
  color: #00c853;
}

.btn {
  background: #00c853;
  color: #fff;
  padding: 8px 16px;
  border-radius: 5px;
  text-decoration: none;
  font-size: 14px;
  transition: background 0.3s;
  align-items: center;
  font-weight: 700;
  
}
.btn1{
  text-decoration: none;
  padding: 8px 16px;
  color: white;
  border-radius: 5px;
    font-size: 14px;
    font-weight: 700;

}
.btn1:hover{
  color: rgb(0, 172, 0);
    padding: 8px 16px;

}

.btn:hover {
  background: #00a046;
}

/* Hamburger Menu */
.hamburger {
  display: none;
  flex-direction: column;
  cursor: pointer;
}

.hamburger span {
  height: 3px;
  width: 25px;
  background: #fff;
  margin: 4px 0;
  border-radius: 2px;
}

/* Responsive */
@media (max-width: 768px) {
  .nav-links {
    display: none;
    position: absolute;
    top: 60px;
    right: 20px;
    background: #0d1117;
    width: 200px;
    border-radius: 8px;
    padding: 15px;
  }

  .nav-links ul {
    flex-direction: column;
  }

  .nav-links li {
    margin: 10px 0;
  }

  .hamburger {
    display: flex;
  }

  .nav-links.active {
    display: block;
  }
}
/* background: linear-gradient(90deg , rgb(12, 12, 12), #0c1324); */
/* box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4); */
.navbar {
    background: transparent;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 14px 40px;

  position: fixed; /* Always stays at the top */
  top: 0;
  left: 0;
  width: 100%;     /* Full width */
  z-index: 1000;   /* Stays above other elements */
}


.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 1.2rem;
  font-weight: bold;
  color: #16a34a;
}

nav a {
  margin: 0 15px;
  text-decoration: none;
  color: #e6e6e6;
  font-weight: 500;
}

.nav-actions {
  display: flex;
  align-items: center;
  gap: 20px;
}

.btn-primary {
  background-color: #16a34a;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  margin-top: 10px;
  margin-bottom: 10px;
}

.btn-outline {
  background: transparent;
  border: 2px solid #16a34a;
  color: #16a34a;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
}

    </style>
</head>
<body>
<%
    String role = null;
    boolean loggedIn = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("jwtToken".equals(c.getName())) {
                try {
                    io.jsonwebtoken.Claims claims = CngBooking.JWTUtils.validateToken(c.getValue());
                    loggedIn = true;
                    role = (String) claims.get("role");
                } catch (Exception e) {
                    loggedIn = false;
                }
            }
        }
    }
%>

    <header class="navbar">
  <div class="container">
    <div class="logo">BookMyCNG</div>

    <nav class="nav-links">
      <ul>
       <%
 
          if (loggedIn && "USER".equals(role)) {
      %>         
        <li><a href="Home1.jsp">Home</a></li>
        <li><a href="#Stations">Find Stations</a></li>
        <li><a href="#Services1">Services</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
         <li>
		     <a href="SlotBookings.jsp">Book Now</a>
		  </li>
      <%
          } else if (loggedIn && "SELLER".equals(role)) {

		%>
		 <li><a href="Home1.jsp">Home</a></li>
        <li><a href="#Services1">Services</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
         <li><a href="#contact-section">Contact</a></li>
          
          <%
          } else if (loggedIn && "ADMIN".equals(role)) { 
		%>
			
        <li><a href="#">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
        <li><a href="#">ManageUsers</a></li>
          <%
		}else {
      %>
         
        <li><a href="Home1.jsp">Home</a></li>
        <li><a href="#">Find Stations</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
        <li  onclick="alert('Please login first! Redirecting...'); window.location.href='Login.jsp';">
		      <a href="#" >Book Now</a>
		</li>
      <%
          }
      %>
      </ul>
    </nav>
	<div class="buttons">
      <%
 
         if (loggedIn && "USER".equals(role)) {
      %>
          <!-- User is logged in -->
          <a href="UserProfile.jsp" class="btn1">Profile</a>
          <a href="LogoutServlet" class="btn">Logout</a>
      <%
          }else if (loggedIn && "SELLER".equals(role)) {
		%>
		  <a href="PumpProfile.jsp" class="btn1">Profile</a>
          <a href="LogoutServlet" class="btn">Logout</a>
          
          <%
          }else if (loggedIn && "ADMIN".equals(role)) {
		%>
			<a href="LogoutServlet" class="btn">Logout</a>
          <%
		}else {
      %>
          <!-- User is not logged in -->
          <a href="signup.jsp" class="btn1">Signup</a>
          <a href="Login.jsp" class="btn">Login</a>
      <%
          }
      %>
    </div>


    <!-- Hamburger menu -->
    <div class="hamburger">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</header>
<script>
  // Example: check if token exists in localStorage
  const token = localStorage.getItem("jwtToken");

  if (token) {
    document.getElementById("authButtons").style.display = "none";
  }
</script>
</body>
</html>