<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- toast.jsp -->
<style>
#toast {
  visibility: hidden;
  min-width: 250px;
  background-color: #16a34a; /* default green */
  color: #fff;
  text-align: left;
  border-radius: 8px;
  padding: 16px 20px;
  position: fixed;
  z-index: 10000;
  right: 20px;   /* top-right corner */
  top: 80px;
  font-weight: bold;
  box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
  transition: all 0.5s ease;
  opacity: 0;
  transform: translateY(-20px);
}
#toast.show {
  visibility: visible;
  opacity: 1;
  transform: translateY(0);
}
</style>

<div id="toast"></div>

<script>
function showToast(message, type="success") {
  const toast = document.getElementById("toast");
  toast.innerText = message;

  // Set color by type
  if (type === "success") toast.style.backgroundColor = "#16a34a";
  if (type === "error") toast.style.backgroundColor = "#dc2626";
  if (type === "info") toast.style.backgroundColor = "#2563eb";

  toast.className = "show";

  setTimeout(() => {
    toast.className = toast.className.replace("show", "");
  }, 3000);
}
</script>

</body>
</html>