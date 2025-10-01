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

public class CngRegistration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CngRegistration() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = 0;
        String name = request.getParameter("pname");
        String address = request.getParameter("address");
        String city = request.getParameter("city");   // ✅ Added city
        String district = request.getParameter("district");
        String state = request.getParameter("state"); // ✅ Auto-filled via frontend
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("pwd");
        String pricePerKg = request.getParameter("price_per_kg"); // ✅ CNG Price input
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");

        String status = "Pending";

        try (Connection con = DBConnection.connect()) {
            PreparedStatement ptmt = con.prepareStatement(
                "INSERT INTO cng_pump (cng_id, pump_name, address, city, district, state, mobileNo, password, price_per_kg, latitude, longitude, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ptmt.setInt(1, id);
            ptmt.setString(2, name);
            ptmt.setString(3, address);
            ptmt.setString(4, city);
            ptmt.setString(5, district);
            ptmt.setString(6, state);
            ptmt.setString(7, mobile);
            ptmt.setString(8, password);
            ptmt.setBigDecimal(9, new java.math.BigDecimal(pricePerKg));
            ptmt.setString(10, latitude);
            ptmt.setString(11, longitude);
            ptmt.setString(12, status);

            int i = ptmt.executeUpdate();

            if (i > 0) {
            	 HttpSession newSession = request.getSession();
			     newSession.setAttribute("PumpRegistered", "CNG Pump Registered SuccessFully");
			     response.sendRedirect("Login.jsp");
            } else {
            	HttpSession newSession = request.getSession();
			     newSession.setAttribute("PumpRegistrationFail", "Registered Fail Try Again !");
			     response.sendRedirect("signup.jsp");
            }
        } catch (Exception e) {
        	HttpSession newSession = request.getSession();
		     newSession.setAttribute("PumpRegistrationFailServerError", "Server Error Try Again !");
		     response.sendRedirect("signup.jsp");
        }
    }
}
