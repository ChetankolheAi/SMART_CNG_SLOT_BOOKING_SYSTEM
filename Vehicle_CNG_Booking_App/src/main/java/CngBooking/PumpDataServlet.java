package CngBooking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;



import com.DbConnection.DBConnection;
import org.json.JSONArray;
import org.json.JSONObject;


public class PumpDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try (Connection con = DBConnection.connect();
             PreparedStatement pst = con.prepareStatement(
                "SELECT cng_id, pump_name, latitude, longitude, city, address, mobileNo FROM cng_pump");
             ResultSet rs = pst.executeQuery()) {

            JSONArray pumpsArray = new JSONArray();

            while (rs.next()) {
                JSONObject pump = new JSONObject();
                pump.put("id", rs.getInt("cng_id"));
                pump.put("name", rs.getString("pump_name"));
                pump.put("lat", rs.getDouble("latitude"));
                pump.put("lng", rs.getDouble("longitude"));
                pump.put("city", rs.getString("city"));
                pump.put("address", rs.getString("address"));
                pump.put("phone", rs.getString("mobileNo"));

                pumpsArray.put(pump);
            }

            out.print(pumpsArray.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }
}
