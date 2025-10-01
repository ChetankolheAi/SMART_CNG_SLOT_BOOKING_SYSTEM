package CngBooking;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DbConnection.DBConnection;
import com.DbConnection.GetSet;

public class UserBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserBooking() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	// ✅ Get user info from session (set during login)
    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("userId") == null) {
    	    response.sendRedirect("login.jsp?error=Please login first");
    	    return;
    	}

    	int userId = (int) session.getAttribute("userId");

    	String station = request.getParameter("station");  // Station ID (from session/GetSet)
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String vehicleType = request.getParameter("vehicleType");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String slotTime = request.getParameter("slot");
        String bookingDate = request.getParameter("date"); // must be yyyy-MM-dd

        // Validate date input
        java.sql.Date sqlDate = null;
        if (bookingDate != null && !bookingDate.isEmpty()) {
            try {
                sqlDate = java.sql.Date.valueOf(bookingDate); // ✅ requires yyyy-MM-dd
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
                response.sendRedirect("404A.html"); // invalid date format
                return;
            }
        } else {
            response.sendRedirect("404.html"); // no date provided
            return;
        }
        
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnection.connect();
            
            // Insert into cng_booking (without booking_date)
            String query = "INSERT INTO cng_booking " +
                    "(station_id, booking_date, slot_time, vehicle_type, vehicle_number, full_name, phone, email ,user_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pst = con.prepareStatement(query);
            pst.setInt(1, Integer.parseInt(station.split("\\)")[0]));
            pst.setDate(2, sqlDate);         // ✅ date stored properly
            pst.setString(3, slotTime);
            pst.setString(4, vehicleType);
            pst.setString(5, vehicleNumber);
            pst.setString(6, fullName);
            pst.setString(7, phone);
            pst.setString(8, email);
            pst.setInt(9, userId);
            
            int i = pst.executeUpdate();
            if (i > 0) {
            	HttpSession newSession = request.getSession();
			     newSession.setAttribute("SlotBooked", "Success! Your CNG reservation is all set with BookMyCNG.");
                response.sendRedirect("Home1.jsp"); // Success
            } else {
            	HttpSession newSession = request.getSession();
			    newSession.setAttribute("Error", "Something went wrong ! Try again ");
                response.sendRedirect("404.html"); // Failure
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("500.html");
        } finally {
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
