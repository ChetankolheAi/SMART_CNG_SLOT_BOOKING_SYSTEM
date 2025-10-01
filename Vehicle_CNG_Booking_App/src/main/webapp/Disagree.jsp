<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import= "com.DbConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));
try
{
	Connection con = DBConnection.connect();
	PreparedStatement ptmt = con.prepareStatement("update cng_pump set status = ? where	cng_id = ?");
	ptmt.setString(1, "Disagree");
	ptmt.setInt(2, id);
	int rs = ptmt.executeUpdate();
	if(rs>0)
	{
		response.sendRedirect("ApprovePump.jsp");
	}
	else
	{
		response.sendRedirect("404.html");
	}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>