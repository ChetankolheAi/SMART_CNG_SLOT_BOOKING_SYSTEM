package CngBooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DBConnection;

/**
 * Servlet implementation class UpdateCNG
 */
public class UpdateCNG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCNG() {
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
		
		String Mobile = request.getParameter("mobile");
		String pass = request.getParameter("pwd");
		String Kg = request.getParameter("CNG_kg");
		
		try 
		{
			Connection con = DBConnection.connect();
			PreparedStatement ptmt = con.prepareStatement("update cng_pump set cng_kg = ? where mobileNo = ? or password = ?");
			
			ptmt.setString(1, Kg);
			ptmt.setString(2, Mobile);
			ptmt.setString(3, pass);
			
			int i = ptmt.executeUpdate();
			
			if(i>0)
			{
				System.out.println("Update Success....");
				response.sendRedirect("UpdateCng.html");
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
