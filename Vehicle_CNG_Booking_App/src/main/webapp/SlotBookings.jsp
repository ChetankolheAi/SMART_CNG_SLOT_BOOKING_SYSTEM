<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
    <%@ page import="io.jsonwebtoken.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CNG Slot Booking</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/qrcode/build/qrcode.min.js"></script>
  
  <style>
    /* General Dark Theme */
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #0d1117;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
     
    }

    .container-bookings {
      background: #111827;
      padding: 30px;
      border-radius: 12px;
      width: 800px;
      box-shadow: 0 0 30px rgba(0, 255, 0, 0.15);
      margin-top: 100px;
 
    align-items: center;   
}

    h2 {
      text-align: center;
      color: white;
      text-shadow: 0 0 10px #00ff66;
      margin-bottom: 20px;
    }

    /* Progress Bar */
    .progressbar {
      display: flex;
      justify-content: space-between;
      margin: 30px 0 40px;
      counter-reset: step;
    }

    .progressbar li {
      list-style-type: none;
      width: 100%;
      position: relative;
      text-align: center;
      color: #aaa;
      font-size: 14px;
    }

    .progressbar li:before {
      content: counter(step);
      counter-increment: step;
      width: 35px;
      height: 35px;
      line-height: 35px;
      border: 2px solid #555;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background: #1f2937;
      color: #aaa;
      font-weight: bold;
    }

    .progressbar li.active:before {
      border-color: #00ff66;
      background: #00ff66;
      color: #111;
      box-shadow: 0 0 15px #00ff66;
    }

    .progressbar li:after {
      content: '';
      position: absolute;
      width: 100%;
      height: 3px;
      background: #333;
      top: 17px;
      left: -50%;
      z-index: -1;
    }

    .progressbar li:first-child:after {
      content: none;
    }

    .progressbar li.active + li:after {
      background: #00ff66;
      box-shadow: 0 0 8px #00ff66;
    }

    /* Form Sections */
    .step {
      display: none;
    }

    .step.active {
      display: block;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    label {
      font-weight: 500;
      display: block;
      margin: 15px 0 5px;
      color: #00ff99;
    }

    input, select {
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      border: none;
      outline: none;
      background: #1f2937;
      color: #fff;
      font-size: 14px;
      margin-bottom: 15px;
    }

    input:focus, select:focus {
      border: 2px solid #00ff66;
      box-shadow: 0 0 10px #00ff66;
    }

    /* Time slots */
    .slots {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
      gap: 10px;
      margin: 15px 0;
    }

    .slot {
      background: #1f2937;
      padding: 10px;
      border-radius: 6px;
      text-align: center;
      cursor: pointer;
      transition: all 0.2s ease-in-out;
      border: 1px solid #333;
      color: #ddd;
    }

    .slot:hover, .slot.active {
      background: #00ff66;
      color: #111;
      box-shadow: 0 0 12px #00ff66;
    }

    /* Buttons */
    .btns {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    button {
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 15px;
      font-weight: bold;
    }

    .btn-prev {
      background: #374151;
      color: #eee;
    }

    .btn-next {
      background: #00ff66;
      color: #111;
      margin-top:15px;
    }

    .btn-prev:hover {
      background: #555;
    }

    .btn-next:hover {
      background: #00cc55;
    }
    .main{
        display: flex;
        flex-direction: column;
        width: 100%;
        justify-content: center;
        align-items: center;
        height: 100%;
    }
    
    .checkout-container {
      display: flex;
      background: #111;
      border-radius: 15px;
      overflow: hidden;
      width: 750px;
    }

    /* Left panel */
    .summary {
      flex: 1;
      padding: 30px;
      background: #1a1f1d;
    }

    .summary h2 {
      margin-bottom: 20px;
      color: white;
      text-shadow: 0 0 10px #00ff66;
    }

    .item {
      display: flex;
      justify-content: space-between;
      margin: 10px 0;
      border-bottom: 1px solid rgba(0,255,102,0.2);
      padding-bottom: 8px;
    }

    .total {
      font-size: 18px;
      font-weight: bold;
      color: #00ff66;
      margin-top: 20px;
      text-shadow: 0 0 8px #00ff66;
    }

    /* Right panel */
    .payment {
      flex: 1;
      padding: 30px;
      text-align: center;
      background: #151a18;
    }

    .payment h2 {
      color: #00ff66;
      margin-bottom: 10px;
    }

    .payment p {
      font-size: 14px;
      color: #bbb;
      margin-bottom: 20px;
    }

    #qrcode {
      margin: 0 auto;
      background: #fff;
      padding: 5px;
      border-radius: 2px;
      display: inline-block;
     
    }
  </style>
</head>
<body>
<%
    String Error = (String) session.getAttribute("Error");
    if (Error != null) {
        session.removeAttribute("Error");
%>
    <script>
        window.onload = function() {
            showToast("<%= Error %>", "success");
        };
    </script>
<%
    }
%>


    <div class="main">

      <!-- Navbar -->
         <header id="navbar"></header>

  <div class="container-bookings">
    <h2>Reserve Your CNG Slot</h2>
    <ul class="progressbar">
      <li class="active">Station & Time</li>
      <li>Vehicle Info</li>
      <li>Customer Details</li>
      <li>Confirmation</li>
    </ul>

    <!-- Step 1 -->
    <div class="step active">
      <label for="station">CNG Station</label>
      <select id="station" required>
        <option>Select a station</option>
          <%
				Connection con = DBConnection.connect();
				try
				{
					PreparedStatement ptmt = con.prepareStatement("select * from cng_pump");
					ResultSet rs = ptmt.executeQuery();
					String cls="active";
					while (rs.next())
					{
			%>
		        <option><%=rs.getInt("cng_id") %>) .  <%=rs.getString("pump_name") %></h3>
		
	<% 
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>
      </select>

      <label>Preferred Date</label>
      <input type="date">

     <div class="slots">
        <div class="slot">00:00 AM</div>
        <div class="slot">01:00 AM</div>
        <div class="slot">02:00 AM</div>
        <div class="slot">03:00 AM</div>
        <div class="slot">04:00 AM</div>
        <div class="slot">05:00 AM</div>
        <div class="slot">06:00 AM</div>
        <div class="slot">07:00 AM</div>
        <div class="slot">08:00 AM</div>
        <div class="slot">09:00 AM</div>
        <div class="slot">10:00 AM</div>
        <div class="slot">11:00 AM</div>
        <div class="slot">12:00 PM</div>
        <div class="slot">01:00 PM</div>
        <div class="slot">02:00 PM</div>
        <div class="slot">03:00 PM</div>
        <div class="slot">04:00 PM</div>
        <div class="slot">05:00 PM</div>
        <div class="slot">06:00 PM</div>
        <div class="slot">07:00 PM</div>
        <div class="slot">08:00 PM</div>
        <div class="slot">09:00 PM</div>
        <div class="slot">10:00 PM</div>
        <div class="slot">11:00 PM</div>
        </div>


      <div class="btns">
        <button class="btn-prev" disabled>Previous</button>
        <button class="btn-next">Next</button>
      </div>
    </div>

    <!-- Step 2 -->
    <div class="step">
      <label for="vehicle-type">Vehicle Type</label>
		<select id="vehicle-type" required>
		  <option value="" disabled selected>Select vehicle type</option>
		  <!-- Passenger Vehicles -->
		  <option>Car</option>
		  <option>SUV</option>
		  <option>Auto Rickshaw</option>
		  <option>Bus</option>
		  <option>Tempo Traveller</option>
		  <!-- Goods Vehicles -->
		  <option>Truck</option>
		  <option>Lorry</option>
		  <option>Three Wheeler (Cargo)</option>
		  <option>Tractor</option>
		  <option>Trailer</option>
		</select>


      <label for="vehicle-number">Vehicle Number</label>
      <input type="text" id="vehicle-number" placeholder="e.g., DL 01 AB 1234" required>

      <div class="btns">
        <button class="btn-prev">Previous</button>
        <button class="btn-next">Next</button>
      </div>
    </div>

    <!-- Step 3 -->
    <div class="step">
      <label for="name">Full Name</label>
      <input type="text" id="name" placeholder="Enter your name" required>

      <label for="phone">Phone Number</label>
      <input type="text" id="phone" placeholder="Enter your phone" required>

      <label for="email">Email</label>
      <input type="email" id="email" placeholder="Enter your email" required>

      <div class="btns">
        <button class="btn-prev">Previous</button>
        <button class="btn-next">Next</button>
      </div>
    </div>


<!-- Step 4 -->
<div class="step">
  <h3 style="text-align:center; color:#00ff99;">Confirmation</h3>
  <p style="text-align:center;">Review your details and confirm your booking.</p>

  <form action="UserBooking" method="post">
    <div style="background:#1f2937; border-radius:8px; margin:20px 0;">
    
    	<div class="checkout-container">
    
	    <!-- Left Order Summary -->
	    <div class="summary">
	      <h2><i class="fa fa-shopping-cart" aria-hidden="true"></i> Your Order</h2>
	      <div class="item">
	        <span>Platform Fees</span>
	        <span><i class="fa fa-inr" aria-hidden="true"></i> 30.00</span>
	      </div>
	      <div class="item">
	        <span>Service charges</span>
	        <span><i class="fa fa-inr" aria-hidden="true"></i> 5.00</span>
	      </div>
	      <div class="item">
	        <span>Tax</span>
	        <span><i class="fa fa-inr" aria-hidden="true"></i> 6.30</span>
	      </div>
	      <div class="total">
	        Total: <i class="fa fa-inr" aria-hidden="true"></i> 41.30
	      </div>
	      <button type="button" class="btn-next" id="download">Download Receipt</button>
	      
	    </div>
	
	    <!-- Right Payment QR -->
	    <div class="payment">
	      <h2>Pay via UPI</h2>
	      <p>Scan the QR code below to complete your payment</p>
	      <div id="qrcode"></div>
	    </div>
	  </div>
	    
    
    
    
    
    
    
    
    

      <p style="display:none"><strong>Station:</strong> <span id="r-station"></span></p>
      <p style="display:none"><strong>Date:</strong> <span id="r-date"></span></p>
      <p style="display:none"><strong>Time Slot:</strong> <span id="r-slot"></span></p>
      <p style="display:none"><strong>Vehicle Type:</strong> <span id="r-vehicle-type"></span></p>
      <p style="display:none"><strong>Vehicle Number:</strong> <span id="r-vehicle-number"></span></p>
      <p style="display:none"><strong>Name:</strong> <span id="r-name"></span></p>
      <p style="display:none"><strong>Phone:</strong> <span id="r-phone"></span></p>
      <p style="display:none"><strong>Email:</strong> <span id="r-email"></span></p>
    </div>

    <!-- Hidden Inputs to actually send data -->
    <input type="hidden" name="station" id="h-station">
    <input type="hidden" name="date" id="h-date">
    <input type="hidden" name="slot" id="h-slot">
    <input type="hidden" name="vehicleType" id="h-vehicle-type">
    <input type="hidden" name="vehicleNumber" id="h-vehicle-number">
    <input type="hidden" name="fullName" id="h-name">
    <input type="hidden" name="phone" id="h-phone">
    <input type="hidden" name="email" id="h-email">

    <div class="btns">
      <button type="button" class="btn-prev">Previous</button>
      <button type="submit" class="btn">Confirm Booking</button>
    </div>
  </form>
</div>

<script>

function fillHiddenFields() {
    document.getElementById("h-station").value = document.getElementById("r-station").textContent;
    document.getElementById("h-date").value = document.getElementById("r-date").textContent;
    document.getElementById("h-slot").value = document.getElementById("r-slot").textContent;
    document.getElementById("h-vehicle-type").value = document.getElementById("r-vehicle-type").textContent;
    document.getElementById("h-vehicle-number").value = document.getElementById("r-vehicle-number").textContent;
    document.getElementById("h-name").value = document.getElementById("r-name").textContent;
    document.getElementById("h-phone").value = document.getElementById("r-phone").textContent;
    document.getElementById("h-email").value = document.getElementById("r-email").textContent;
  }

  document.querySelector("form").addEventListener("submit", fillHiddenFields);
</script>

  <!-- Footer -->
</div>

<footer id="footer"></footer>
</div>
<style>
  .progressbar {
    display: flex;
    justify-content: space-between;
    margin: 30px 0 40px;
    counter-reset: step;
  }

  .progressbar li {
    list-style-type: none;
    width: 100%;
    position: relative;
    text-align: center;
    color: #aaa;
    font-size: 14px;
  }

  /* Default Circle */
  .progressbar li:before {
    content: counter(step);
    counter-increment: step;
    width: 40px;
    height: 40px;
    line-height: 38px;
    border: 2px solid #555;
    display: block;
    text-align: center;
    margin: 0 auto 10px auto;
    border-radius: 50%;
    background: #1f2937;
    color: #aaa;
    font-weight: bold;
    font-size: 16px;
  }

  /* Completed Step with â */
  .progressbar li.completed:before {
    content: "\2714";  /* Unicode for fa-inr */
    font-family: "Font Awesome 5 Free"; /* or "Font Awesome 6 Free" depending on version */
    font-weight: 900;  /* required for solid icons */
    background: #00ff66;
    border-color: #00ff66;
    color: #111;
    box-shadow: 0 0 15px #00ff66;
    font-size: 18px;
}


  /* Active Step (number highlighted) */
  .progressbar li.active:before {
    border-color: #00ff66;
    background: #00ff66;
    color: #111;
    box-shadow: 0 0 15px #00ff66;
  }

  /* Line Connector */
  .progressbar li:after {
    content: '';
    position: absolute;
    width: 100%;
    height: 3px;
    background: #333;
    top: 20px;
    left: -50%;
    z-index: -1;
  }

  .progressbar li:first-child:after {
    content: none;
  }

  .progressbar li.completed + li:after {
    background: #00ff66;
    box-shadow: 0 0 8px #00ff66;
  }
</style>

 <script>
    // Generate QR on load
    window.onload = function() {
      let upi = "chetankolhe1020@okicici";
      let name = "Chetan Kolhe";
      let amount = "41.30";

      let upiLink = "upi://pay?pa=" + upi + "&pn=" + encodeURIComponent(name) + "&am=" + amount + "&cu=INR";


      QRCode.toCanvas(document.createElement("canvas"), upiLink, { width: 220 }, function (error, canvas) {
        if (error) console.error(error);
        else document.getElementById("qrcode").appendChild(canvas);
      });
    }
  </script>

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
<script src="Downlode1.js"></script>

</html>

