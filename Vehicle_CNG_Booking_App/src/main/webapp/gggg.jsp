<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nearby CNG Pumps</title>
<style>
  #map {
    height: 400px;
    width: 100%;
    margin-top: 15px;
  }
  .pump-list {
    margin-top: 20px;
  }
  .station-card {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 6px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }
</style>
</head>
<body>
<h2>Nearby CNG Pumps</h2>

<!-- Button -->
<button onclick="getNearbyPumps()">Show Nearby Pumps</button>

<!-- Map -->
<div id="map"></div>

<!-- Pump Cards -->
<div class="pump-list"></div>

<script>
let userLat = null, userLng = null; // store globally
let map;

function getNearbyPumps() {
  fetch("http://localhost:8080/Vehicle_CNG_Booking_App/getPumps")
    .then(r => r.json())
    .then(data => {
      window.pumps = data;

      navigator.geolocation.getCurrentPosition(
        (pos) => {
          userLat = pos.coords.latitude;
          userLng = pos.coords.longitude;

          const nearby = pumps.filter(p => getDistance(userLat, userLng, p.lat, p.lng) <= 5);
          renderPumps(nearby);
          initMap(userLat, userLng, nearby);
        },
        (err) => {
          console.error("Location error:", err);
          // fallback center
          userLat = 18.44;
          userLng = 73.83;
          renderPumps(pumps);
          initMap(userLat, userLng, pumps);
        }
      );
    })
    .catch(err => console.error("Error fetching pumps:", err));
}

// Distance function
function getDistance(lat1, lon1, lat2, lon2) {
  const R = 6371;
  const dLat = (lat2 - lat1) * Math.PI / 180;
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const a =
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(lat1 * Math.PI/180) * Math.cos(lat2 * Math.PI/180) *
    Math.sin(dLon/2) * Math.sin(dLon/2);
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
}

function renderPumps(list) {
  const container = document.querySelector(".pump-list");
  container.innerHTML = "";

  list.forEach(p => {
    container.innerHTML += `
      <div class="station-card">
        <h3>${p.name}</h3>
        <p>${p.address}, ${p.city}</p>
        <p><b>Phone:</b> ${p.phone}</p>
      
        <a href="https://www.google.com/maps?q=${p.lat},${p.lng}" target="_blank">Show on Map</a>
      </div>
    `;
  });
}

function initMap(userLat, userLng, pumps) {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: userLat, lng: userLng },
    zoom: 12
  });

  // User marker
  new google.maps.Marker({
    position: { lat: userLat, lng: userLng },
    map: map,
    title: "You are here",
    icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
  });

  // Pump markers
  pumps.forEach(p => {
    new google.maps.Marker({
      position: { lat: p.lat, lng: p.lng },
      map: map,
      title: p.name
    });
  });
}
</script>

<!-- Google Maps -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcDk77FDyMxRMk5L-sIf_xXsl_oGeWI3w"></script>
</body>
</html>
