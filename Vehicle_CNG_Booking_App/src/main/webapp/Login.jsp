<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - CNG Reserve</title>
  <link rel="stylesheet" href="auth.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
  .divider {
  display: flex;
  align-items: center;
  text-align: center;
   color: #fff; 
  margin: 20px 0;
  font-size: 14px;
}

.divider::before,
.divider::after {
  content: "--------";
  flex: 1;
}

.divider:not(:empty)::before {
  margin-right: .75em;
}

.divider:not(:empty)::after {
  margin-left: .75em;
}

/* Google Button */
.google-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 10px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
  width: 100%;
}

.google-btn img {
  width: 18px;
  height: 18px;
}

.google-btn:hover {
  background: #f7f7f7;
}
#loginForm{
width:100%;
}
  </style>
  <script>
    // Load navbar
    fetch("navbar.jsp")
      .then(res => res.text())
      .then(data => document.getElementById("navbar").innerHTML = data);

    // Load footer
    fetch("footer.html")
      .then(res => res.text())
      .then(data => document.getElementById("footer").innerHTML = data);
  </script>
</head>
<body>
<%
    String Registered = (String) session.getAttribute("UserResitered");
    if (Registered != null) {
        // clear it so it doesn't show again on refresh
        session.removeAttribute("UserResitered");
%>
    <script>
    window.onload = function() {
        showToast("<%= Registered %>", "success");
    };
    </script>
<%
    }
%>
<%
    String WrongData = (String) session.getAttribute("UserLoginError");
    if (WrongData != null) {
        // clear it so it doesn't show again on refresh
        session.removeAttribute("UserLoginError");
%>
    <script>
    window.onload = function() {
        showToast("<%= WrongData %>", "error");
    };
    </script>
<%
    }
%>

<%
    String PumpRegistered = (String) session.getAttribute("PumpRegistered");
    if (PumpRegistered != null) {
        // clear it so it doesn't show again on refresh
        session.removeAttribute("PumpRegistered");
%>
    <script>
    window.onload = function() {
        showToast("<%= PumpRegistered %>", "success");
    };
    </script>
<%
    }
%>
  <div class="main">
    <header id="navbar"></header>
    
    <div class="auth-container">
      <div class="role-buttons">
        <button type="button" class="role-btn" data-role="admin">Admin</button>
        <button type="button" class="role-btn" data-role="seller">CNG Seller</button>
        <button type="button" class="role-btn active" data-role="user">User</button>
      </div>

      <div class="auth-box">
        <div class="input">
          <h2>Login</h2>
          <form id="loginForm" method="post">
            <!-- Hidden input to store role -->
            <input type="hidden" name="role" id="role" value="user">

            <!-- Email -->
            <div class="input-group">
              <i class="fa fa-envelope"></i>
              <input type="email" name="email" placeholder="Email" required>
            </div>

            <!-- Password -->
            <div class="input-group">
              <i class="fa fa-lock"></i>
              <input type="password" name="pwd" placeholder="Password" required>
            </div>

            <!-- Submit -->
            <button type="submit" class="auth-btn">Login</button>
          </form>
          
          <!-- OR divider -->
			<div class="divider">
			  <span>OR</span>
			</div>
			
			<!-- Google Login Button -->
			<button type="button" class="google-btn">
			  <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google Logo">
			  Continue with Google
			</button>
			          	<p class="switch-text">Don't have an account? <a href="signup.jsp">Sign Up</a></p>
        </div>

        <div class="banner"></div>
      </div>
    </div>
  </div>

  <div id="footer"></div>

  <script>
    const roleBtns = document.querySelectorAll(".role-btn");
    const roleInput = document.getElementById("role");
    const loginForm = document.getElementById("loginForm");

    roleBtns.forEach(btn => {
      btn.addEventListener("click", () => {
        roleBtns.forEach(b => b.classList.remove("active"));
        btn.classList.add("active");
        roleInput.value = btn.getAttribute("data-role");
      });
    });

    loginForm.addEventListener("submit", function (e) {
      e.preventDefault();
      const role = roleInput.value;

      if (role === "user") {
        loginForm.action = "ULogin";       // maps to ULogin.java
      } else if (role === "seller") {
        loginForm.action = "CngPumpLogin"; // maps to CngPumpLogin.java
      } else if (role === "admin") {
        loginForm.action = "Admin";        // maps to Admin.java
      }

      loginForm.submit();
    });
  </script>
</body>
<jsp:include page="toast.jsp" />
</html>
