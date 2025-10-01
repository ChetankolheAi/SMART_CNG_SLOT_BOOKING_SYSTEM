package CngBooking;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.*;

import com.DbConnection.DBConnection;

public class PumpOrders extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PumpOrders() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("pumpId") == null) {
            response.sendRedirect("PumpLogin.jsp?error=Please login first");
            return;
        }
        System.out.print("Helo");
        int pumpId = (int) session.getAttribute("pumpId"); // set at login
        List<String[]> orders = new ArrayList<>();

        try (Connection con = DBConnection.connect()) {
        	String yearParam = request.getParameter("year");
        	String monthParam = request.getParameter("month");
        	
        	String query = "SELECT b.booking_id, u.name, u.mobile, b.booking_date, b.slot_time, " +
                    "b.vehicle_type, b.vehicle_number " +
                    "FROM cng_booking b " +
                    "JOIN user u ON b.user_id = u.uid " +
                    "WHERE b.station_id = ?";

        
        	if(yearParam.equals("ALL") && monthParam.equals("ALL")) {
        		
        	}
        	else if (yearParam != null && monthParam != null) {
        	    query += " AND b.booking_date LIKE ?";
        	}
        	PreparedStatement pst = con.prepareStatement(query);
        	pst.setInt(1, pumpId);
        	
        	if(yearParam.equals("ALL") && monthParam.equals("ALL")) {
        		
        	}
        	else if (yearParam != null && monthParam != null) {
        	    String monthFormatted = String.format("%02d", Integer.parseInt(monthParam));
        	    pst.setString(2, yearParam + "-" + monthFormatted + "%");  // e.g. "2025-09%"
        	}


            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String[] row = new String[7];
                row[0] = rs.getString("booking_id");
                row[1] = rs.getString("name");      // user name
                row[2] = rs.getString("mobile");    // user phone
                row[3] = rs.getString("booking_date");
                row[4] = rs.getString("slot_time");
                row[5] = rs.getString("vehicle_type");
                row[6] = rs.getString("vehicle_number");
                // you can add status as row[7] if needed
                orders.add(row);
            }


            request.setAttribute("orders", orders);
            RequestDispatcher rd = request.getRequestDispatcher("PumpOrderDash.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
