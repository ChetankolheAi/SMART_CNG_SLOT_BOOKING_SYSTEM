package CngBooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DbConnection.DBConnection;
import com.DbConnection.GetSet;

/**
 * Servlet implementation class Admin
 */
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String uemail = request.getParameter("email");
		String upass = request.getParameter("pwd");
		
		try
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("select * from admin where email=? and password=?");
			ptmt.setString(1, uemail);
			ptmt.setString(2, upass);
			ResultSet rs= ptmt.executeQuery();
			if(rs.next())
			{
				 int AdminId = rs.getInt("id"); 
	               
	 
	                // Create session
	                HttpSession session = request.getSession();
	                session.setAttribute("userId", AdminId); 
	                session.setAttribute("email", uemail);
	                session.setAttribute("memberSince", "Jan 2024"); // example, replace with DB value if available

	                // Generate JWT token
	                String token = JWTUtils.generateToken(uemail ,"ADMIN");

	                // Store JWT in cookie
	                Cookie jwtCookie = new Cookie("jwtToken", token);
	                jwtCookie.setHttpOnly(true);  // JS can't access
	                jwtCookie.setPath("/");       // available across app
	                response.addCookie(jwtCookie);
	                HttpSession newSession = request.getSession();
				    newSession.setAttribute("AdminLoggedIn", "Admin LoggedIn SuccessFully");
	                // ✅ Redirect to home page
	                response.sendRedirect("AdminDash.jsp");
			}
			else
			{	
				 HttpSession newSession = request.getSession();
				 newSession.setAttribute("UserLoginError", "Invalid email or password");
		         response.sendRedirect("Login.jsp");
			
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
