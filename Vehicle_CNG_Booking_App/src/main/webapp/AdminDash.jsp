<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CNG Pumps - BookMyCNG</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="style.css"> <!-- Keep your main CSS -->

  <style>
  
    body {
      background-color: #0b0f19;
      color: #e5e5e5;
      font-family: 'Inter', sans-serif;
      margin: 0;
      padding: 0;
    }
    .container-Available-pump {
      max-width: 1200px;
      margin: 80px auto;
      padding: 20px;
    }
    h1 {
      text-align: center;
      color: #ffffff;
      text-shadow: 0 0 10px #22c55e, 0 0 20px #22c55e;
      margin-bottom: 40px;
    }
    .pump-list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
    }
    .pump-card {
      background: #111827;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.6);
      transition: transform 0.3s, box-shadow 0.3s;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .pump-card a{
    text-decoration:none;
    }
    .pump-card:hover {
        transform: translateY(-5px);
    }
    .pump-card h3 {
        margin: 0 0 10px;
        color: #ffffff;
    }
    .pump-card p {
        margin: 6px 0;
        color: #cbd5e1;
    }
    .pump-card i {
        margin-right: 8px;
        color: #156432;
    }
    .remove-btn {
        margin-top: 15px;
        padding: 10px;
        border: none;
        border-radius: 8px;
        background: #22c55e;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .remove-btn:hover {
        background: #dc2626;
        box-shadow: 0 0 12px #ef4444, 0 0 2px #ef4444;
    }
    .container-User{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 60px;
        max-width:1200px;
        margin: 80px auto;
    }
   
    .card-list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
      width: 100%;
    }
    .card {
      background: #111827;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.6);
      transition: transform 0.3s, box-shadow 0.3s;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .card h3 {
      margin: 0 0 10px;
      color: #22c55e;
    }
    .card p {
      margin: 6px 0;
      color: #cbd5e1;
    }
    .card i {
      margin-right: 8px;
      color: #065e26;
    }
    .remove-btn {
      margin-top: 15px;
      padding: 10px;
      border: none;
      border-radius: 8px;
      background: #22c55e;
      color: #fff;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .remove-btn:hover {
      background: #dc2626;
    }
    .stats-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  max-width: 1000px;
  margin: 40px auto;
  padding: 20px;
}
.stats-container p {
    font-size: 1rem;
    color: #8b8b8b;
    margin-bottom: 40px;
}
.stat-card {
  background: #111827;
  border-radius: 12px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0,0,0,0.6);
  transition: transform 0.3s, box-shadow 0.3s;
}
.stat-card:hover {
  transform: translateY(-5px);
}
.stat-card i {
  color: #22c55e;
  margin-bottom: 10px;
}
.stat-card h2 {
  margin: 10px 0;
  color: #22c55e;
}
.stat-card h4{
    color: gray;
    font-size: 1.5rem;
}
.stat-card p {
  font-size: 1.5rem;
  font-weight: bold;
  color: #ffffff;
}
.Hero-Admin{
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.buttons-remove button{
	margin-right:20px;
}
/* Pump card container */
.pump-card {
    background: #1f2937;        /* your dark theme background */
    border-radius: 12px;
    padding: 20px;
    margin: 15px 0;
    box-shadow: 0 2px 8px rgba(0,0,0,0.25);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

/* Hover effect */
.pump-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 4px 14px rgba(0,0,0,0.35);
}

/* Pump name */
.pump-card h3 {
    font-size: 18px;
    font-weight: 600;
    color: #00ff99;   /* highlight with your green */
    margin-bottom: 12px;
}

/* Pump info text */
.pump-card p {
    margin: 6px 0;
    font-size: 14px;
    color: #e5e7eb;  /* light gray for readability */
    display: flex;
    align-items: center;
}

/* Pump info icons */
.pump-card p i {
    margin-right: 8px;
    font-size: 14px;
    color: #00ff66;  /* subtle green accent */
}

/* Buttons section */
.buttons-remove {

    display: flex;
    align-items: center;
}

/* Action button */
.remove-btn {
    background: transparent;
    border: 1px solid #00ff66;
    color: #00ff66;
    padding: 8px 14px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 6px;
    transition: all 0.3s ease;
    
}

/* Button hover */
.remove-btn:hover {
    background: #00ff66;
    color: #1f2937;   /* invert for contrast */
}

/* Button icon */
.remove-btn i {
    font-size: 14px;
}

  </style>
  
</head>

<body>


<%
    String AdminLoggedIn = (String) session.getAttribute("AdminLoggedIn");
    if (AdminLoggedIn != null) {
        // clear it so it doesn't show again on refresh
        session.removeAttribute("AdminLoggedIn");
%>
    <script>
    window.onload = function() {
        showToast("<%= AdminLoggedIn %>", "success");
    };
    </script>
<%
    }
%>
  <!-- Navbar -->
  <header id="navbar"></header>
  <div class="Hero-Admin">
    <h1>Admin Page</h1>
      <!-- Stats Section -->
<div class="stats-container">
  <div class="stat-card">
    <i class="fa fa-users fa-2x"></i>
    <h2>Total Users</h2>
    <h4>
        <%
            int totalUsers = 0;
            try {
                Connection con = DBConnection.connect();
                PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM user"); // table: users
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    totalUsers = rs.getInt(1);
                }
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.print(totalUsers);
        %>
    </h4>
</div>

  <div class="stat-card">
    <i class="fa fa-gas-pump fa-2x"></i>
    <h2>Total Pumps</h2>
    <h4> <%
            int totalPumps = 0;
            try {
                Connection con = DBConnection.connect();
                PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM cng_pump"); // table: users
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    totalPumps = rs.getInt(1);
                }
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.print(totalPumps);
        %></h4><!-- Replace with dynamic value -->
  </div>

  <div class="stat-card">
    <i class="fa fa-coins fa-2x"></i>
    <h2>Total Earnings</h2>
    <h4><i class="fa fa-inr" aria-hidden="true"></i> 1,25,000</h4> <!-- Replace with dynamic value -->
  </div>
</div>
</div>
  <!-- Pump Info Section -->
  <div class="container-Available-pump">
    <h1>Registered CNG Pumps</h1>
    <div class="pump-list">

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
															    	
				
		        <div class="pump-card">
                <div>
                    <h3><%= rs.getString("pump_name") %></h3>
                    <p><i class="fa fa-city"></i>City: <%= rs.getString("city") %></p>
                    <p><i class="fa fa-phone"></i>Phone:  <%= rs.getString("mobileNo") %></p>
                   <p><i class="fa fa-map-marker-alt"></i> Address: <%= rs.getString("address") %></p>
                   <p><i class="fa fa-location"></i> District: <%= rs.getString("district") %></p>
                   <p><i class="fa fa-circle"></i> State: <%= rs.getString("state") %></p>
                	<p><i class="fa fa-square"></i> Latitude: <%= rs.getString("latitude") %></p>
                    <p><i class="fa fa-diamond"></i> longitude: <%= rs.getString("longitude") %></p>
                   
                   <a href="https://www.google.com/maps?q=<%= rs.getString("latitude") %>,<%= rs.getString("longitude") %>" 
					   target="_blank" 
					>
					    <button type="submit" class="remove-btn">
                        <i class="fa fa-location"></i> Show on Map
                    </button>
					</a>
					                   
                    
                </div>

                <!-- Example: remove by ID -->
                <form action="RemovePump" method="post" style="display:inline;" class="buttons-remove">
                    <input type="hidden" name="pumpId" value="<%= rs.getInt("cng_id") %>">
                   
                   
                </form>
            </div>
		
		<% 
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>
       
    </div>
</div>
<!--  <button type="submit" class="remove-btn">
                        <i class="fa fa-trash"></i> Remove
                    </button> -->
    <!-- Users Section -->
  <div class="container-User">
    <h1>Registered Users</h1>
    <div class="card-list">
	 <%
				Connection con1 = DBConnection.connect();
				try
				{
					PreparedStatement ptmt = con1.prepareStatement("select * from user");
					ResultSet rs = ptmt.executeQuery();
					String cls="active";
					while (rs.next())
					{
			%>
	      <div class="card">
	        <div>
	          <h3><%= rs.getString("name") %></h3>
	          <p><i class="fa fa-envelope"></i> <%= rs.getString("email") %></p>
	          <p><i class="fa fa-phone"></i> +91 <%= rs.getString("mobile") %></p>
	         	<p><i class="fa fa-city"></i> <%= rs.getString("city") %></p>
	          
	        </div>
	        <button class="remove-btn"><i class="fa fa-trash"></i> Remove</button>
	      </div>
	<% 
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>
      <div class="card">
        <div>
          <h3>Priya Mehta</h3>
          <p><i class="fa fa-envelope"></i> priya.mehta@example.com</p>
          <p><i class="fa fa-phone"></i> +91 99887 77665</p>
        </div>
        <button class="remove-btn"><i class="fa fa-trash"></i> Remove</button>
      </div>

      <div class="card">
        <div>
          <h3>Amit Verma</h3>
          <p><i class="fa fa-envelope"></i> amit.verma@example.com</p>
          <p><i class="fa fa-phone"></i> +91 98765 12345</p>
        </div>
        <button class="remove-btn"><i class="fa fa-trash"></i> Remove</button>
      </div>

    </div>
  </div>
  </div>


  <!-- Footer -->
  <footer id="footer"></footer>

  <script>
    // Load navbar and footer dynamically
    fetch("navbar.jsp").then(res => res.text()).then(data => {
      document.getElementById("navbar").innerHTML = data;
    });
    fetch("footer.html").then(res => res.text()).then(data => {
      document.getElementById("footer").innerHTML = data;
    });

    // Example JS for removing card (client-side only)
   
  </script>
</body>
</html>
