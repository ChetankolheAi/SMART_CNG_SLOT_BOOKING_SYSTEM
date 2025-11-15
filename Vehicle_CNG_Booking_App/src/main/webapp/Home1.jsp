<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
    <%@ page import="io.jsonwebtoken.Claims" %>
<%@ page import="io.jsonwebtoken.JwtException" %>
<%@ page import="CngBooking.JWTUtils" %>
<%@ page import="javax.servlet.http.Cookie" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Edu+NSW+ACT+Cursive:wght@400..700&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Manufacturing+Consent&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Oswald:wght@200..700&family=Outfit:wght@100..900&family=Roboto:ital,wght@0,100..900;1,100..900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&family=Winky+Rough:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>

<script>AOS.init();</script>

  <script>
    // Load navbar.html into #navbar
    fetch("navbar.jsp")
      .then(res => res.text())
      .then(data => {
        document.getElementById("navbar").innerHTML = data;
      });
  </script>
   <script>
    // Load footer.html into #footer
    fetch("footer.html")
      .then(res => res.text())
      .then(data => {
        document.getElementById("footer").innerHTML = data;
      });
    

// JS to trigger animation when section enters viewport
const sections = document.getElementsByClassName('.pricing-section');

const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
    }
  });
}, { threshold: 0.2 });

sections.forEach(section => {
  observer.observe(section);
});


  </script>
  <style>

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: "Segoe UI", sans-serif;
}
 .clock-container {
      text-align: center;
      background: #111827;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 30px rgba(0, 255, 0, 0.15);
    }

    #time {
      font-size: 60px;
      font-weight: bold;
      color: #00ff66;
      text-shadow: 0 0 20px #00ff66;
    }

    #date {
      font-size: 20px;
      margin-top: 8px;
      color: #aaa;
      text-shadow: 0 0 10px rgba(0, 255, 100, 0.3);
    }
/* Start hidden */
.section {
  opacity: 0;
  transform: translateY(50px);
  transition: all 0.8s ease-out;
}

/* When visible */
.section.show {
  opacity: 1;
  transform: translateY(0);
}

html {
  scroll-behavior: smooth;
}
body {
  background: #0d1117;
  color: #e6e6e6;
/* Firefox */
}

body::-webkit-scrollbar {
  display: none; /* Chrome, Safari, Edge */
}


.navbar {
  background: #277dfe;
  color: #fff;
  padding: 13px 0;
  position: sticky;
  top: 0;
  z-index: 1000;
  display: flex;
  justify-content: center;
}

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


/* Navbar */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 40px;
}

/* background: linear-gradient(90deg , rgb(12, 12, 12), #0c1324);;
box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4); */
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
  background-color: #f82e2e00;
  color: rgb(236, 0, 0);
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

/* Hero Section */
.hero {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px 40px;
  gap: 40px;
  flex-wrap: wrap;
  background: #0d1117;
  min-height: 100vh;
  overflow: hidden;
  flex-direction: row;
}

.hero::before {
  content: "";
  position: absolute;
  inset: 0;
  background: url('https://id-preview--9a53410b-06b4-4cd3-a471-189ee70e5bee.lovable.app/assets/cng-station-hero-BoQZu8mo.jpg') no-repeat center center;
  background-size: cover;
  opacity: 0.07; /* faint background image */
  z-index: 0;
}

.hero-text,
.reservation-form {
  position: relative;
  z-index: 1;
  height: 250px;

}

.hero-text h1 {
  font-size: 3rem;
  margin-bottom: 10px;
  color: #fff;
  text-shadow: 
    0 0 5px #22c55e,
    0 0 10px #22c55e,
    0 0 20px #22c55e,
    0 0 40px #16a34a,
    0 0 80px #16a34a;
    display: flex;
    justify-content: center;
     font-family: "Josefin Sans", sans-serif;
  font-optical-sizing: auto;
  font-weight: 700;
  font-style: normal;
}
.hero-buttons{
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
}
  /* .highlight {
    color: #16a34a;
  } */

.hero-text p {
  font-size: 1.1rem;
  margin-bottom: 20px;
  color: #ccc;
  display: flex;
  justify-content: center;
}

.stats {
  display: flex;
  gap: 40px;
  font-size: 1.1rem;

  justify-content: center;
  transform:translateY(5px);
}

.stats div {
  text-align: center;
  font-size: 20px;
  font-family: "Ubuntu", sans-serif;
  font-weight: 500;
  font-style: normal;
  padding-top: 60px;
}
.stats strong{
  color: rgb(2, 157, 2);
}

/* Reservation Form */
.reservation-form {
  background: #161b22;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
  width: 100%;
  max-width: 420px;
  color: #e6e6e6;
}

.reservation-form h2 {
  margin-bottom: 20px;
  font-size: 1.4rem;
  color: #fff;
}

input, select, textarea {
  padding: 10px;
  border: 1px solid #333;
  border-radius: 6px;
  background: #0d1117;
  color: #e6e6e6;
  width: 100%;
  margin-top: 10px;
  
}

input::placeholder,
textarea::placeholder {
  color: #aaa;
}

.note {
  font-size: 0.8rem;
  color: #888;
  margin-top: 10px;
}

/* Pricing Section */
.pricing-section {
  text-align: center;
  padding: 60px 20px;
  background-color: #0d1117;
  padding-bottom: 100px;
}

.pricing-section h2 {
  font-size: 2.5rem;
  margin-bottom: 10px;
  color: #fff;
}

.pricing-section h2 span {
  color: #16a34a;
}

.subheading {
  font-size: 1.1rem;
  color: #aaa;
  margin-bottom: 40px;
}

.pricing-cards {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 30px;
}

.card {
  background: #161b22 ;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.4);
  padding: 30px 40px;
  max-width: 300px;
  flex: 1;
  position: relative;
  text-align: left;
  color: #e6e6e6;
  transition: 0.5s ease-in-out;
}
.card:hover{
  transition: 0.5s ease-in-out;
  border: 2px solid green;
}
.card h3 {
  font-size: 1.3rem;
  margin-bottom: 5px;
  color: #fff;
}

.card-sub {
  color: #aaa;
  font-size: 0.95rem;
  margin-bottom: 20px;
}

.price {
  font-size: 2rem;
  color: #16a34a;
  font-weight: bold;
  margin-bottom: 20px;
}

ul li {
  margin-bottom: 10px;
  position: relative;
  margin-top: 10px;
  font-size: 16px;
  list-style: none;
}



/* Highlighted card */
.popular {
  border: 2px solid #16a34a;
  box-shadow: 0 10px 25px rgba(0,0,0,0.6);
}

.badge {
  position: absolute;
  top: -12px;
  left: 50%;
  transform: translateX(-50%);
  background-color: #16a34a;
  color: white;
  padding: 5px 12px;
  font-size: 0.8rem;
  border-radius: 20px;
  font-weight: bold;
}

/* Contact Section */
.contact-section {
  padding: 60px 20px;
  background-color: #0d1117;
  text-align: center;
  padding-bottom: 100px;
}

.contact-section h2 {
  font-size: 2.5rem;
  margin-bottom: 10px;
  color: #fff;
}

.contact-section h2 span {
  color: #16a34a;
}

.contact-container {
  display: flex;
  flex-wrap: wrap;
  gap: 80px;
  justify-content: center;
  align-items: flex-start;
}

.contact-info {
  flex: 1;
  max-width: 400px;
  text-align: left;
}

.contact-info h3 {
  font-size: 1.4rem;
  margin-bottom: 20px;
  color: #fff;
}

.info-item {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
  color: #ccc;
}

.icon {
  width: 36px;
  height: 36px;
  background:linear-gradient(90deg , rgb(1, 144, 1), rgb(25, 216, 79));
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 8px;
  font-size: 1.2rem;
  margin-right: 15px;
  color: white;
}

.emergency-box {
  background-color: #16281d;
  border-left: 4px solid #16a34a;
  padding: 20px;
  margin-top: 20px;
  border-radius: 8px;
  color: #e6e6e6;

}
.emergency-box p{
  margin-top: 10px;
}

.btn-emergency {
  background-color: #16a34a;
  color: white;
  padding: 8px 14px;
  border: none;
  border-radius: 6px;
  margin-top: 10px;
  cursor: pointer;
  font-size: 0.95rem;
}
/* Section Background */
.stations-section {
  padding: 60px 20px;
  background: #0a0f1b; /* bluish black */
  color: #f1f5f9;
  text-align: center;
}

/* Heading */
.stations-header h2 {
  font-size: 2rem;
  margin-bottom: 10px;
  color: #e2e8f0;
}

.stations-header h2 span {
  color: #22c55e;
}

.stations-header p {
  color: #94a3b8;
  margin-bottom: 40px;
}

/* Grid */
.stations-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 30px;
  max-width: 1200px;
  margin: 0 auto;
}

/* Cards */
.station-card {
  background: #161b22;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
  text-align: left;
  transition: transform 0.2s ease-in-out;
}

.station-card:hover {
  transform: translateY(-5px);
}

/* Header */
.station-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.station-header h3 {
  font-size: 1.2rem;
  font-weight: 600;
  color: #f8fafc;
}

.price {
  font-size: 1.2rem;
  font-weight: bold;
  color: #22c55e;
}

.price small {
  font-size: 0.8rem;
  color: #94a3b8;
}

/* Address */
.address {
  margin: 8px 0;
  color: #cbd5e1;
  font-size: 0.95rem;
}

/* Info */
.station-info {
  display: flex;
  gap: 20px;
  font-size: 0.9rem;
  margin-bottom: 10px;
  color: #94a3b8;
}

.station-info i {
  color: #decc00;
  margin-right: 6px;
}

/* Status */
.status {
  font-size: 0.9rem;
  margin-bottom: 12px;
  display: flex;
  gap: 12px;
}

.status .open {
  color: #22c55e;
  font-weight: bold;
}

/* Tags */
.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 15px;
}

.tags span {
  background: #334155;
  padding: 6px 12px;
  border-radius: 20px;
  font-size: 0.85rem;
  color: #f1f5f9;
}

/* Buttons */
.actions {
  display: flex;
  gap: 10px;
  width:100%;
}
.actions a{
width:100%;
}
.reserve-btn {
  flex: 1;
  background: #22c55e;
  color: white;
  border: none;
  padding: 10px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: 500;
  width:100%;
}

.reserve-btn:hover {
  background: #16a34a;
}

.map-btn {
  width: 45px;
  border: 1px solid #475569;
  border-radius: 6px;
  background: #1e293b;
  cursor: pointer;
  font-size: 1.2rem;
  color: #f8fafc;
}

.map-btn:hover {
  background: #334155;
}

/* View All */
.view-all {
  margin-top: 40px;
}

.view-all button {
  background: transparent;
  border: 1px solid #22c55e;
  color: #22c55e;
  padding: 10px 20px;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
}

.view-all button:hover {
  background: #22c55e;
  color: white;
}

/* Contact Form */
.contact-form {
  flex: 1;
  max-width: 500px;
  background-color: #161b22;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 5px 20px rgba(0,0,0,0.5);
  text-align: left;
  color: #e6e6e6;
}

.contact-form h3 {
  margin-bottom: 20px;
  font-size: 1.4rem;
  color: #fff;
}
.reserve-btn a{
text-decoration:none;
color:white;
}
/* Footer Styles */
.footer {
  background: #0d1117;
  color: #fff;
  padding: 40px 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.footer-container {
  max-width: 1200px;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.footer-about{
  margin-right: 40px;
}
.footer-about h4{
  margin-top: 40px;
  font-size: 20px;
}
.footer-about,
.footer-links,
.footer-services,
.footer-contact {
  flex: 1;
  min-width: 220px;
  margin-bottom: 20px;
}

.footer-logo {
  color: #ffffff;
  font-size: 20px;
  display: flex;
  align-items: center;
}
.footer-logo span {
  color: #00c853;
}

.footer-about p {
  color: #bbb;
  font-size: 14px;
  line-height: 1.6;
  margin: 10px 0;
}

.footer-socials a {
  color: #bbb;
  margin-right: 12px;
  font-size: 18px;
  text-decoration: none;
}

.footer-links a,
.footer-services a {
  color: #bbb;
  text-decoration: none;
  font-size: 14px;
}

.footer-links a:hover,
.footer-services a:hover,
.footer-policy a:hover,
.footer-socials a:hover {
  color: #00c853;
}

.footer-contact p {
  font-size: 14px;
  color: #bbb;
  margin: 10px 13px;
}
.footer-contact ul{
  display: flex;
  align-items: center;
}
.footer-bottom {
  border-top: 1px solid #222;
  margin-top: 20px;
  padding-top: 15px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  font-size: 13px;
  color: #aaa;
}

.footer-policy a {
  color: #bbb;
  margin-left: 15px;
  text-decoration: none;
  font-size: 13px;
}
.stats-banner {
  background: linear-gradient(90deg , rgb(12, 12, 12), rgb(4, 0, 23)); /* light gray */
  padding: 60px 20px;
  display: flex;
  justify-content: center;
}

.stats-container {
  background: linear-gradient(90deg , rgb(0, 0, 0),rgb(7, 0, 44));;
  padding: 40px 30px;
  border-radius: 16px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
  text-align: center;
  max-width: 1200px;
  width: 100%;
}

.stats-container h2 {
  font-size: 2rem;
  margin-bottom: 10px;
  color: #ffffff;
  font-weight: 700;
}

.stats-container p {
  font-size: 1rem;
  color: #8b8b8b;
  margin-bottom: 40px;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 30px;
}

.stat-item h3 {
  color: #16a34a; /* green highlight */
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: 8px;
}

.stat-item p {
  color: #7c7c7c;
  font-size: 1rem;
}

/* Responsive */
@media (max-width: 900px) {
  .pricing-cards {
    flex-direction: column;
    align-items: center;
  }
}

@media (max-width: 768px) {
  .hero {
    flex-direction: column;
    padding: 30px 20px;
  }

  .stats {
    justify-content: space-between;
  }

  .date-time {
    flex-direction: column;
  }

  .contact-container {
    flex-direction: column;
    align-items: stretch;
  
  }

  .form-row {
    flex-direction: column;
  }
}


.chat-toggle {
  position: fixed;
  bottom: 0px;
  right: 0px;
 
  border: none;
  border-radius: 50%;
  cursor: pointer;
  color: #fff;
  font-size: 10px;
 
  transition: all 0.3s ease;
  z-index: 100000000;
}
 .ChatContainer{

            height: 220px;
            width: 200px;
        }
.chat-toggle:hover {

}

.chatbot-container {
    position: fixed;
    bottom: 10px;
    right: 180px;
    width: 400px;
    background: #111827;
    border-radius: 12px;
    display: none;
    flex-direction: column;
    overflow: hidden;
	
    z-index: 100000000;
}
.chat-header {

  background: #000217;
  color: #fff;
  padding: 10px;
  font-weight: bold;
  display: flex;
  justify-content: space-between;
  align-items: center;
      text-shadow: 0 0 5px #22c55e, 0 0 10px #22c55e, 0 0 20px #22c55e, 0 0 40px #16a34a, 0 0 80px #16a34a;
}
.chat-header i{
font-size:20px;
    text-shadow: 0 0 5px #22c55e, 0 0 10px #22c55e, 0 0 20px #22c55e, 0 0 40px #16a34a, 0 0 80px #16a34a;
}
.chat-body {
  height: 400px;
  padding: 10px;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.msg {
  padding: 10px;
  border-radius: 8px;
  max-width: 90%;
}
.msg.bot {
  background: #1e293b;
  color: white;
  align-self: flex-start;
  padding-left:20px;
}
.msg.user {
  background: #22c55e;
  color: #fff;
  align-self: flex-end;
}
.chat-footer {
  display: flex;
  padding: 10px;
  background: #1e293b;
}

.chat-footer input {
  flex: 1;
  border: none;
  border-radius: 8px;
  padding: 15px 15px;
	
  background: #0b0f19;
  color: #fff;
  margin:0;
  font-size:15px;
  margin-right:10px;
}
.chat-footer button {
  background: #22c55e;
  border: none;
  border-radius: 8px;
  padding: 10px;
  color: #fff;
  cursor: pointer;
  width:60px;
  font-size:20px;
   transition : 0.3s ease;
              
   
}
.chat-footer button:hover {
  transform: translateY(-3px);
  transition : 0.3s ease;
    background: #22c55f;
  
}

.close-btn {
  cursor: pointer;
  height: 40px;

  font-size: 28px; /* slightly smaller so it centers better */
  display: flex;
  justify-content: center;
  align-items: center; /* ✅ correct spelling (not align-item) */
  border-radius: 50%; /* makes it circular */
  transition: background 0.2s ease, transform 0.2s ease;
    width: 40px;
}

.close-btn:hover {
  background: rgba(0, 0, 0, 0.1); /* subtle hover effect */
  transform: rotate(90deg); /* optional: rotate on hover */
}

.close-btn:active {
  transform: scale(0.9); /* press-down effect */
}

.hero-buttons a{
	text-decoration:none;
	color:white;
}
.btn-primary{
	border:2px solid green;

}
.hero-buttons a:hover{
	color: black;

}
.btn-outline a:hover{
color:green;
}
  .remove-btn {
	
      padding: 10px;

      border-radius: 8px;
      background: transparent;
      color: #fff;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      border: 2px soild green;   	
      transition : 0.3s ease;
}
.remove-btn:hover {
  transform: translateY(-3px);
  transition : 0.3s ease;
  }
::-webkit-scrollbar {
  display: none;
}
  #map {
     
      z-index:-10000000;
    }
    .hero-text h2{
    	text-align:center;
    	margin-bottom:30px;
    }
    .services {
      max-width: 1100px;
      margin: 40px auto ;
      padding:100px 20px 0px 20px;
      text-align: center;
    }

    .services h2 {
      font-size: 30px;
      margin-bottom: 10px;
      color: white;
      text-shadow: 0 0 5px #22c55e, 0 0 10px #22c55e, 0 0 20px #22c55e, 0 0 40px #16a34a, 0 0 80px #16a34a;
    }

    .services p {
      color: #9ca3af;
      font-size: 16px;
      margin-bottom: 30px;
    }

    .service-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 25px;
    }

    .service-card {
      background: #161b22;
      border-radius: 12px;
      padding: 25px;
      text-align: center;
      box-shadow: 0 6px 15px rgba(0,0,0,0.4);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .service-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 20px rgba(0, 255, 153, 0.3);
    }

    .icon {

      margin-bottom: 15px;
     
      
    }

    .service-card h3 {
      color: #e5e7eb;
      margin-bottom: 10px;
      font-size: 20px;
    }

    .service-card p {
      color: #9ca3af;
      font-size: 14px;
    }
  </style>
  
  <script>
  window.onload = function () {
    if (!sessionStorage.getItem("reloaded")) {
      sessionStorage.setItem("reloaded", "true");
      location.reload();
    }
  };
</script>
  
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


<%
    String SlotBooked = (String) session.getAttribute("SlotBooked");
    if (SlotBooked != null) {
        session.removeAttribute("SlotBooked");
%>
    <script>
        window.onload = function() {
            showToast("<%= SlotBooked %>", "success");
        };
    </script>
<%
    }
%>


<%
    String logoutMsg = (String) session.getAttribute("logoutMsg");
    if (logoutMsg != null) {
        session.removeAttribute("logoutMsg");
%>
    <script>
        window.onload = function() {
            showToast("<%= logoutMsg %>", "success");
        };
    </script>
<%
    }
%>


<%
    String Loggedinmssg = (String) session.getAttribute("UserLoggedin");
    if (Loggedinmssg != null) {
        // clear it so it doesn't show again on refresh
        session.removeAttribute("UserLoggedin");
%>
    <script>
    window.onload = function() {
        showToast("<%= Loggedinmssg %>", "success");
    };
    </script>
<%
    }
%>

<script>
    let pumps = [];
    <%  
        Connection con11 = DBConnection.connect();
        try {
            PreparedStatement ptmt = con11.prepareStatement("select * from cng_pump");
            ResultSet rs = ptmt.executeQuery();
            while (rs.next()) {
    %>
            pumps.push({
                id: <%=rs.getInt("cng_id") %>,
                name: "<%=rs.getString("pump_name") %>",
                price: "<%=rs.getString("price_per_kg") %>",
                address: "<%=rs.getString("address") %>, <%=rs.getString("district") %>",
                phone: "<%=rs.getString("mobileNo") %>",
                city: "<%=rs.getString("city") %>",
                lat: <%=rs.getDouble("latitude") %>,
                lng: <%=rs.getDouble("longitude") %>
            });
    <%  
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
</script>

     <header id="navbar"></header>
     <div id="toast"></div>
     
      <main class="hero">
          
    <div class="hero-text">
   
  
        <%
		
          if (loggedIn && "USER".equals(role)) {
		%>
		
		    <h1>Skip the line. Book your CNG slot today</h1>
		     <p>
		        Book your CNG refueling slot in advance. Eco-friendly, cost-effective, and convenient fuel for your vehicle.
		      </p>
		<%
		    } else if (loggedIn && "SELLER".equals(role)) {
		%>	
			 <h2> CNG SELLER DASHBOARD</h2>
		    <h1>Your station, your customers, your control</h1>
		     <p>
				Manage orders easily, serve faster, grow bigger.Because every drop of fuel deserves the right place
		      </p>
		<%
		    } else {
		%>
		    <h1>Skip the line. Book your CNG slot today</h1>
		     <p>
		        Book your CNG refueling slot in advance. Eco-friendly, cost-effective, and convenient fuel for your vehicle.
		      </p>
		<%
		    }
		%>
     
      <div class="hero-buttons">
        <%
		   
        if (loggedIn && "USER".equals(role)) {
		%>
		    <button class="btn-primary">
		      <a href="SlotBookings.jsp">Reserve Your Slots</a>
		    </button>
		<%
		    } else if (loggedIn && "SELLER".equals(role)) {
		%>
		   
		    <button class="btn-primary">
		      <a href="PumpProfile.jsp">Manage Your Bookings</a>
		    </button>
		<%
		    }else{
		%>
		
		    <button class="btn-primary" onclick="alert('Please login first! Redirecting...'); window.location.href='Login.jsp';">
		      Reserve Your Slots
		    </button>
		<%
		    }
        %>
        <button class="btn-outline" onclick="getLocation()"><a href="#"><i class="fa fa-location" aria-hidden="true"></i> My Location</a></button>
      	
      </div>
	<iframe src="Clock.html" style="border:none; width:100%; height:150px; overflow:hidden;" scrolling="no";></iframe>

<%
		
          if (loggedIn && "USER".equals(role)) {
		%>
		    <div class="stats">
		        <div><strong>50+</strong><br />CNG Stations</div>
		        <div><strong>24/7</strong><br />Service</div>
		        <div><strong>10K+</strong><br />Happy Coustomers</div>
		      </div>
		<%
		    } else if (loggedIn && "SELLER".equals(role)) {
		%>
		   
		<%
		    } else {
		%>
		    <div class="stats">
		        <div><strong>50+</strong><br />CNG Stations</div>
		        <div><strong>24/7</strong><br />Service</div>
		        <div><strong>10K+</strong><br />Happy Coustomers</div>
		      </div>
		<%
		    }
		%>
      
    </div>
    <div class="earth">

    <header id="map"></header>
    </div>

    
  </main>


  <%
		
          if (loggedIn && "SELLER".equals(role)) {
        	  
          }
          else{
%>                 
 <section class="stations-section" id="Stations" >
  <div class="stations-header">
  
    <h2><span>CNG Stations</span> Near You</h2>
    <p>Find the most convenient CNG station with real-time availability and competitive prices</p>
  </div>
  <div class="stations-grid">
    <!-- Station Card -->
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
															    	
    <div class="station-card" data-lat="<%= rs.getString("latitude") %>" 
	     data-lng="<%= rs.getString("longitude") %>">
	     
      <div class="station-header">
        <h3><%=rs.getString("pump_name") %></h3>
        
        <span class="price"><i class="fa fa-inr" aria-hidden="true"></i><%=rs.getString("price_per_kg") %> <small>/Kg</small></span>
      </div>
      <p class="address"><i class="fa fa-map-marker-alt"></i> <%=rs.getString("address") %>,<%=rs.getString("district") %></p>
      <div class="station-info">
        <span class="distance"><i class="fa fa-road"></i> ~-- km</span>
        <span><i class="fa fa-star"></i> 4.8</span>
      </div>
      <div class="status">
        <span class="open"><i class="fa fa-circle" aria-hidden="true"></i> Open Now</span>
        <span>8 slots available</span>
      </div>
      <div class="tags">
        <span>24/7 Service</span>
        <span><%=rs.getString("mobileNo") %></span>
        <span><%=rs.getString("city") %></span>
        <span>+1 more</span>
      </div>
      <div class="actions">
          <%
		
          if (loggedIn && "USER".equals(role)) {
		%>
		    <a href="SlotBookings.jsp"><button class="reserve-btn">Reserve Slots</button></a>
		<%
		    } else if (loggedIn && "SELLER".equals(role)) {
		%>
		    <a href="#"><button class="reserve-btn">Reserve Slots</button></a>
		<%
		    } else {
		%>
		    <a href="#"><button class="reserve-btn" onclick="alert('Please login first! Redirecting...'); window.location.href='Login.jsp';">Reserve Slots</button></a>
		<%
		    }
		%>
        
        <a href="https://www.google.com/maps?q=<%= rs.getString("latitude") %>,<%= rs.getString("longitude") %>" 
					   target="_blank">
					    <button type="submit" class="remove-btn">
                        	<i class="fa fa-location"></i> Show on Map
                    	</button>
		</a>
      </div>
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
<div class="pump-list"></div>

  <div class="view-all">
    <button>View All Stations</button>
  </div>
  
</section>
<%
          }
%>
	
  <section class="services" id="Services1">
    <h2>Why Choose CNG Reserve?</h2>
    <p>Experience the future of CNG refueling with our smart reservation system designed to save your time and enhance your journey.</p>

    <div class="service-grid">
      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-clock"></i></div>
        <h3>Time Slot Booking</h3>
        <p>Reserve your preferred time slot and avoid waiting in long queues.</p>
      </div>

      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
        <h3>Station Locator</h3>
        <p>Find the nearest CNG stations with real-time availability.</p>
      </div>

      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-lock"></i></div>
        <h3>Secure Payments</h3>
        <p>Safe and encrypted payment processing for all your reservations.</p>
      </div>

      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-mobile-screen"></i></div>
        <h3>Mobile Friendly</h3>
        <p>Book and manage reservations on-the-go with our responsive design.</p>
      </div>

      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-headset"></i></div>
        <h3>24/7 Support</h3>
        <p>Round-the-clock customer support for all your queries.</p>
      </div>

      <div class="service-card">
        <div class="icon"><i class="fa-solid fa-star"></i></div>
        <h3>Premium Experience</h3>
        <p>Enjoy priority service and exclusive benefits with our platform.</p>
      </div>
    </div>
  </section>


  <section class="pricing-section" id="services">
  <h2><span>Transparent</span> Pricing</h2>
  <p class="subheading">
    Choose the plan that best fits your CNG needs. No hidden fees, no surprises.
  </p>

  <div class="pricing-cards">
    <!-- Pay Per Use -->
    <div class="card">
      <h3>Pay Per Use</h3>
      <p class="card-sub">Perfect for occasional users</p>
      <div class="price"><i class="fa fa-inr" aria-hidden="true"></i>75<span class="unit"> per kg</span></div>
      <ul>
        <li>Standard CNG rate</li>
        <li>No commitments</li>
        <li>Pay as you go</li>
        <li>All station access</li>
        <li>Mobile app support</li>
      </ul>
      <button class="btn-outline">Start Fueling</button>
    </div>



    <!-- Monthly Pass -->
    <div class="card popular">
      <div class="badge">⭐ Most Popular</div>
      <h3>Monthly Pass</h3>
      <p class="card-sub">Best value for regular commuters</p>
      <div class="price"><i class="fa fa-inr" aria-hidden="true"></i>3,500<span class="unit"> per month</span></div>
      <ul>
        <li>Up to 50kg CNG</li>
        <li><i class="fa fa-inr" aria-hidden="true"></i>70 per kg rate</li>
        <li>Priority booking</li>
        <li>Free vehicle inspection</li>
        <li>24/7 customer support</li>
        <li>Mobile app premium features</li>
      </ul>
      <button class="btn-primary">Get Monthly Pass</button>
    </div>

    <!-- Business Fleet -->
    <div class="card">
      <h3>Business Fleet</h3>
      <p class="card-sub">Bulk pricing for commercial vehicles</p>
      <div class="price"><i class="fa fa-inr" aria-hidden="true"></i>65<span class="unit"> per kg</span></div>
      <ul>
        <li>Bulk discount pricing</li>
        <li>Dedicated account manager</li>
        <li>Fleet management tools</li>
        <li>Priority service lanes</li>
        <li>Detailed usage reports</li>
        <li>Custom billing cycles</li>
        <li>Emergency fuel delivery</li>
      </ul>
      <button class="btn-outline">Contact Sales</button>
    </div>
  </div>
</section>
<section class="stats-banner">
  <div class="stats-container">
    <h2>Trusted by Thousands</h2>
    <p>Join our growing community of satisfied customers</p>

    <div class="stats-grid">
      <div class="stat-item">
        <h3>50+</h3>
        <p>CNG Stations</p>
      </div>
      <div class="stat-item">
        <h3>10K+</h3>
        <p>Happy Customers</p>
      </div>
      <div class="stat-item">
        <h3>24/7</h3>
        <p>Support Available</p>
      </div>
      <div class="stat-item">
        <h3>99.9%</h3>
        <p>Uptime Guarantee</p>
      </div>
    </div>
  </div>
</section>

 <section class="contact-section" id="contact-section">
  <h2>Get In <span>Touch</span></h2>
  <p class="subheading">
    Have questions about our CNG services? We're here to help you with all your fuel needs.
  </p>

  <div class="contact-container">
    <!-- Contact Info -->
    <div class="contact-info">
      <h3>Contact Information</h3>

      <div class="info-item">
        <div class="icon"><i class="fa-solid fa-phone"></i></div>
        <div>
          <strong>Customer Support</strong><br />
          1-800-CNG-FUEL<br />
          +91 9876543210
        </div>
      </div>

      <div class="info-item">
        <div class="icon"><i class="fa-solid fa-envelopes-bulk"></i></div>
        <div>
          <strong>Email Support</strong><br />
          support@ecogascng.com<br />
          reservations@ecogascng.com
        </div>
      </div>

      <div class="info-item">
        <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
        <div>
          <strong>Head Office</strong><br />
          123 Green Energy Boulevard<br />
          Metro City, State 12345
        </div>
      </div>

      <div class="info-item">
        <div class="icon"><i class="fa-regular fa-clock"></i></div>
        <div>
          <strong>Support Hours</strong><br />
          24/7 Emergency Support<br />
          Mon-Fri: 8AM-8PM (General)
        </div>
      </div>

      <div class="emergency-box">
        <strong>Emergency Assistance</strong>
        <p>For urgent fuel delivery or roadside assistance, call our 24/7 emergency hotline.</p>
        <button class="btn-emergency">Emergency Hotline: 911-CNG-HELP</button>
      </div>
    </div>

    <!-- Contact Form -->
    <div class="contact-form">
      <h3>Send us a Message</h3>
      <form>
        <div class="form-row">
          <input type="text" placeholder="Your first name" required />
          <input type="text" placeholder="Your last name" required />
        </div>
        <input type="email" placeholder="your.email@example.com" required />
        <input type="tel" placeholder="+91 98765 43210" required />
        <input type="text" placeholder="How can we help you?" required />
        <textarea placeholder="Tell us more about your inquiry..." rows="4" required></textarea>
        <button type="submit" class="btn-primary">Send Message</button>
        <p class="form-note">We'll get back to you within 24 hours</p>
      </form>
    </div>
  </div>
</section>



<!-- Footer Section -->
<footer class="footer">
  <div class="footer-container">

    <!-- Logo & About -->
    <div class="footer-about">
      <h3 class="footer-logo">
        <span><i class="fa-solid fa-gas-pump"></i> </span>_BookMyCNG
      </h3>
      <p>
        The most convenient way to reserve your CNG refueling slots and skip the wait times.
      </p>
      <div class="footer-socials">
        <a href="#"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-facebook"></i></i></a>
        <a href="#"><i class="fa-brands fa-linkedin"></i></a>
        <a href="#"><i class="fa-brands fa-twitter"></i></a>
      </div>
      <h4>BookMyCNG</h4>
    </div>

    <!-- Quick Links -->
    <div class="footer-links">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="#">Find Stations</a></li>
        <li><a href="#">Book Reservation</a></li>
        <li><a href="#">My Bookings</a></li>
        <li><a href="#">Pricing</a></li>
        <li><a href="#">Help Center</a></li>
      </ul>
    </div>

    <!-- Services -->
    <div class="footer-services">
      <h4>Services</h4>
      <ul>
        <li><a href="#">CNG Reservation</a></li>
        <li><a href="#">Station Locator</a></li>
        <li><a href="#">Mobile App</a></li>
        <li><a href="#">Fleet Solutions</a></li>
        <li><a href="#">API Integration</a></li>
      </ul>
    </div>

    <!-- Contact -->
    <div class="footer-contact">
      <h4>Contact Us</h4>
      
     
      <ul><i class="fa-solid fa-phone"></i> <p>+91 98765 43210</p></ul>
      <ul><i class="fa-solid fa-envelope"></i> <p>support@BookMyCNG.com</p></ul>
      <ul><i class="fa-solid fa-location-dot"></i> <p>123 Green Energy Plaza,<br>Sector 15, New Delhi - 110001</p></ul>
    </div>
  </div>

  <div class="footer-bottom">
    <p>© 2024 Book My CNG . All rights reserved.</p>
    <div class="footer-policy">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Service</a>
      <a href="#">Cookie Policy</a>
    </div>
  </div>
</footer>
<!-- Chatbot Section -->
<div class="chatbot-container" id="chatbot">
  <div class="chat-header">
    <i class="fa fa-robot"></i> BookMyCNG Assistant
    <span id="closeChat" class="close-btn">&times;</span>
  </div>
  <div class="chat-body" id="chatBody">
    <div class="msg bot">Hello ! How can I help you today?</div>
  </div>
  <div class="chat-footer">
    <input type="text" id="chatInput" placeholder="Type your message..." />
    <button id="sendBtn"><i class="fa fa-paper-plane"></i></button>
  </div>
</div>

<!-- Floating Chat Button -->
<div class="ChatContainer chat-toggle" id="chatToggle">

        <script type="module" src="https://unpkg.com/@splinetool/viewer@1.10.71/build/spline-viewer.js"></script>
<spline-viewer url="https://prod.spline.design/28Y0cItWiTB3SAlS/scene.splinecode"></spline-viewer>


    </div>

<script src="Chatbot1.js"></script>
<script src="Map.js"></script>
</script>
	
<script>
	

function getLocation() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition, showError);
	  } else {
	    alert("Geolocation is not supported by this browser.");
	  }
	}

	function showPosition(position) {
	  const lat = position.coords.latitude;
	  const lon = position.coords.longitude;
	
	  const mapUrl = `https://www.google.com/maps?q=${lat},${lon}`;
	  initMap(28.6129, 77.2295);
	  window.open(mapUrl, "_blank"); // opens directly
	}

	function showError(error) {
	  switch(error.code) {
	    case error.PERMISSION_DENIED:
	      alert("User denied the request for Geolocation.");
	      break;
	    case error.POSITION_UNAVAILABLE:
	      alert("Location information is unavailable.");
	      break;
	    case error.TIMEOUT:
	      alert("The request to get user location timed out.");
	      break;
	    case error.UNKNOWN_ERROR:
	      alert("An unknown error occurred.");
	      break;
	  }
	}
	 function initMap(lat, lon) {
	      map = new google.maps.Map(document.getElementById("map"), {
	        zoom: 15,
	        center: { lat: lat, lng: lon },
	      });
	      new google.maps.Marker({
	        position: { lat: lat, lng: lon },
	        map: map,
	        title: "You are here!",
	        icon: "http://maps.google.com/mapfiles/ms/icons/-dot.png"
	      });
	    }
</script>

<!-- Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcDk77FDyMxRMk5L-sIf_xXsl_oGeWI3w"></script>

</body>
<jsp:include page="toast.jsp" />

</html>