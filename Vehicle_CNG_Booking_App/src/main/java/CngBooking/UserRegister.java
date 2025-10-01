package CngBooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DbConnection.DBConnection;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		
		int uid=0;
		String Uname =  request.getParameter("name");
		String Uemail = request.getParameter("email");
		String Umob = request.getParameter("mobile");
		String Upass = request.getParameter("pwd");
		String Ucity = request.getParameter("city");		
		
		try
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
			ptmt.setInt(1, uid);
			ptmt.setString(2, Uname);
			ptmt.setString(3, Uemail);
			ptmt.setString(4, Umob);
			ptmt.setString(5, Upass);
			ptmt.setString(6, Ucity);
			int i = ptmt.executeUpdate();
			if(con == null) {
			    throw new RuntimeException("Database connection failed!");
			}

			if(i>0)
			{	
				 HttpSession newSession = request.getSession();
			     newSession.setAttribute("UserResitered", "User Registered SuccessFully");
				response.sendRedirect("Login.jsp");
			}
			else
			{
				response.sendRedirect("404.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
