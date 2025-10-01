<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up - CNG Reserve</title>
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
  <style>
  /* Full Page Background */
body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
  background: #0f172a; /* bluish black */
  color: #f1f5f9;
 
  height: 100vh;
}

/* Centered Box */
.auth-container {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 140vh;
    
}

.auth-box {
  background: linear-gradient(90deg , rgb(8, 8, 9) , rgb(0, 0, 35));
  
  border-radius: 12px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
  text-align: center;
  width: 800px;
  display: flex;
  flex-direction: row;
  justify-content: center;
 

}
.input{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;

	min-width:400px;
    padding: 70px 50px;
    
}
.banner{
    
    background-color: rgb(8, 0, 45);
    width: 400px;
    
}
/* Heading */
.auth-box h2 {
  margin-bottom: 20px;
  color: #ffffff;
  font-weight: bold;

  /* Neon effect */
  text-shadow: 
    0 0 5px #22c55e,
    0 0 10px #22c55e,
    0 0 20px #22c55e,
    0 0 40px #16a34a,
    0 0 80px #16a34a;
}


/* Input Fields */
.input-group {
  display: flex;
  align-items: center;
  background: #0f172a;
  margin-bottom: 15px;
  padding: 10px 12px;
  border-radius: 8px;
}

.input-group i {
  margin-right: 10px;
  color: #22c55e;
}

.input-group input {
  border: none;
  outline: none;
  background: transparent;
  color: #f8fafc;
  width: 100%;
  font-size: 0.95rem;
}

/* Button */
.auth-btn {
  background: #22c55e;
  border: none;
  width: 100%;
  padding: 12px;
  border-radius: 8px;
  color: #fff;
  font-weight: 600;
  cursor: pointer;
  transition: 0.3s;
}

.auth-btn:hover {
  background: #16a34a;
}

/* Switch Text */
.switch-text {
  margin-top: 15px;
  font-size: 0.9rem;
  color: #cbd5e1;
}

.switch-text a {
  color: #22c55e;
  text-decoration: none;
  font-weight: 500;
}

.switch-text a:hover {
  text-decoration: underline;
}
.input-group select {
  width: 100%;
  padding: 10px;
  border-radius: 6px;
  border: 1px solid #444;
  background: #0c1324;
  color: #fff;
  font-size: 0.95rem;
  outline: none;
}

.input-group select:focus {
  border-color: #22c55e;
  box-shadow: 0 0 8px #22c55e;
}
.role-buttons {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  gap: 10px;
}

.role-btn {
    width: 100px;
  flex: 1;
  padding: 10px;
  border: 2px solid #22c55e;
  background: transparent;
  color: #22c55e;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  transition: all 0.3s ease;
}

.role-btn:hover {
  background: #22c55e;
  color: #fff;
}

.role-btn.active {
  background: #22c55e;
  color: #fff;
}
.form-fields {
  display: flex;
  gap: 30px;
  justify-content: space-between;
}

.common-fields, .seller-fields {
  flex: 1;
  display: flex;
  flex-direction: column;
}

  </style>
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
</head>
<body>
<%
    String ErrorMssg = (String) session.getAttribute("UserAlreadyExists");
    if (ErrorMssg != null) {
        session.removeAttribute("UserAlreadyExists");
%>
    <script>
    window.onload = function() {
        showToast("<%= ErrorMssg %>", "error");
    };
    </script>
<%
    }
%>

<%
    String PumpRegistrationFail = (String) session.getAttribute("PumpRegistrationFail");
    if (ErrorMssg != null) {
        session.removeAttribute("PumpRegistrationFail");
%>
    <script>
    window.onload = function() {
        showToast("<%= PumpRegistrationFail %>", "error");
    };
    </script>
<%
    }
%>

<%
    String PumpRegistrationFailServerError = (String) session.getAttribute("PumpRegistrationFailServerError");
    if (ErrorMssg != null) {
        session.removeAttribute("PumpRegistrationFailServerError");
%>
    <script>
    window.onload = function() {
        showToast("<%= PumpRegistrationFailServerError %>", "error");
    };
    </script>
<%
    }
%>
  <header id="navbar"></header>
  <div class="auth-container">
    <div class="role-buttons">
      <button type="button" class="role-btn" data-role="seller">CNG Seller</button>
      <button type="button" class="role-btn active" data-role="user">User</button>
 
    </div>

    <div class="auth-box">
  
      <div class="input">
        <h2>Sign Up</h2>
   
<!-- Inside your auth-box form -->
<form id="signupForm" method="post" style="width:100%">
  <input type="hidden" name="role" id="role" value="user">

  <div class="form-fields">
    <!-- Common User Fields -->
    <div class="common-fields">
      <div class="input-group">
        <i class="fa fa-user"></i>
        <input type="text" name="name" id="name" placeholder="Full Name" required>
      </div>
      <div class="input-group">
        <i class="fa fa-envelope"></i>
        <input type="email" name="email" id="email" placeholder="Email" required>
      </div>
      <div class="input-group">
        <i class="fa fa-phone"></i>
        <input type="text" name="mobile" id="mobile" placeholder="Mobile Number" required>
      </div>
      <div class="input-group">
        <i class="fa fa-city"></i>
        <input type="text" name="city" id="city" placeholder="City" required>
      </div>
      <div class="input-group">
        <i class="fa fa-lock"></i>
        <input type="password" name="pwd" id="pwd" placeholder="Password" required>
      </div>
      <div class="input-group">
        <i class="fa fa-lock"></i>
        <input type="password" id="confirmPwd" placeholder="Confirm Password" required>
      </div>
    </div>

    <!-- Seller Extra Fields (Initially Hidden) -->
    <div id="sellerFields" class="seller-fields" style="display:none;">
  		<div class="input-group">
	    <i class="fa fa-gas-pump"></i>
	    <input type="text" name="pname" placeholder="Pump Name" />
	  </div>
	  <div class="input-group">
	    <i class="fa fa-map-marker-alt"></i>
	    <input type="text" name="address" placeholder="Address" />
	  </div>
	  <div class="input-group">
	    <i class="fa fa-location-arrow"></i>
	    <input type="text" id="latitude" name="latitude" placeholder="Latitude" />
	  </div>
	  <div class="input-group">
	    <i class="fa fa-location-arrow"></i>
	    <input type="text" id="longitude" name="longitude" placeholder="Longitude" />
	  </div>
	  <div class="input-group" >
	    <i class="fa fa-city"></i>
	    <input type="text" id="state" name="state" placeholder="State"  />
	  </div>
	  <div class="input-group" >
	    <i class="fa fa-map"></i>
	    <input type="text" id="district" name="district" placeholder="District"  />
	  </div>
	  <div class="input-group">
	    <i class="fa fa-money-bill"></i>
	    <input type="text" id="price_per_kg" name="price_per_kg" placeholder="CNG Per Kg Price" />
	  </div>
	</div>


  </div>

  <!-- Submit -->
  <button type="submit" class="auth-btn">Sign Up</button>
  <!-- OR divider -->
			<div class="divider">
			  <span>OR</span>
			</div>
			
			<!-- Google Login Button -->
			<button type="button" class="google-btn">
			  <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google Logo">
			  Continue with Google
			</button>
</form>


        <p class="switch-text">Already have an account? <a href="Login.jsp">Login</a></p>
      </div>
    </div>
  </div>

  <div id="footer"></div>

  <script>
  const roleBtns = document.querySelectorAll(".role-btn");
  const roleInput = document.getElementById("role");
  const signupForm = document.getElementById("signupForm");
  const sellerFields = document.getElementById("sellerFields");

  // Toggle on button click
  roleBtns.forEach(btn => {
    btn.addEventListener("click", () => {
      roleBtns.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      roleInput.value = btn.getAttribute("data-role");

      // ✅ Show/Hide Seller Fields
      if (roleInput.value === "seller") {
        sellerFields.style.display = "block";
      } else {
        sellerFields.style.display = "none";
      }
    });
  });

  // On page load, ensure correct state
  if (roleInput.value === "seller") {
    sellerFields.style.display = "block";
  } else {
    sellerFields.style.display = "none";
  }

  signupForm.addEventListener("submit", function (e) {
    e.preventDefault();

    // Common values
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const mobile = document.getElementById("mobile").value.trim();
    const city = document.getElementById("city").value.trim();
    const pwd = document.getElementById("pwd").value.trim();
    const confirmPwd = document.getElementById("confirmPwd").value.trim();
    const role = roleInput.value;

    // ✅ Validations
    if (name.length < 3) {
      showToast("Name must be at least 3 characters", "error");
      return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      showToast("Enter a valid email", "error");
      return;
    }

    const mobileRegex = /^[0-9]{10}$/;
    if (!mobileRegex.test(mobile)) {
      showToast("Mobile number must be 10 digits", "error");
      return;
    }

    if (city.length < 2) {
      showToast("City name too short", "error");
      return;
    }

    if (pwd.length < 6) {
      showToast("Password must be at least 6 characters", "error");
      return;
    }

    if (pwd !== confirmPwd) {
      showToast("Passwords do not match", "error");
      return;
    }

    // ✅ Extra validation for seller
    if (role === "seller") {
      const pumpName = document.querySelector("input[name='pname']").value.trim();
      const address = document.querySelector("input[name='address']").value.trim();


      if (pumpName.length < 3) {
        showToast("Pump name must be at least 3 characters", "error");
        return;
      }
      if (address.length < 5) {
        showToast("Address must be at least 5 characters", "error");
        return;
      }
    
    }

    // ✅ Decide servlet target
    if (role === "user") {
      signupForm.action = "UserRegister";
    } else if (role === "seller") {
      signupForm.action = "CngRegistration";
    } 

    signupForm.submit();
  });

  </script>
  
</body>
<jsp:include page="toast.jsp" />
</html>
