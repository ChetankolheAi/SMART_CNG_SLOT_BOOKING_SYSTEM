package CngBooking;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DbConnection.DBConnection;
@WebServlet("/UserOrders")
public class UserOrders extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserOrders() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("Login.jsp?error=Please login first");
            return;
        }
        System.out.println("UserOrders servlet called");


        int userId = (int) session.getAttribute("userId");
        List<String[]> orders = new ArrayList<>();

        try (Connection con = DBConnection.connect()) {
            String query = "SELECT * FROM cng_booking WHERE user_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userId);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String[] row = new String[7];
                row[0] = rs.getString("booking_id");
                row[1] = rs.getString("station_id");
                row[2] = rs.getString("booking_date");
                row[3] = rs.getString("slot_time");
                row[4] = rs.getString("vehicle_type");
                row[5] = rs.getString("vehicle_number");
                
                orders.add(row);
            }

            // ✅ Attach orders to request
            request.setAttribute("orders", orders);

            // ✅ Forward (NOT redirect!)
            RequestDispatcher rd = request.getRequestDispatcher("UserOrdersDash.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("500.html");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
