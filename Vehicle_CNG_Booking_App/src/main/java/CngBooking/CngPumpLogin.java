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

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class CngPumpLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Secret key for JWT signing (store securely, not hardcoded ideally)
    private static final String SECRET_KEY = "myUltraSecureJWTSecretKeyWithMoreThan32Chars!";

    public CngPumpLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("pwd");

        try (Connection con = DBConnection.connect()) {
            PreparedStatement ptmt = con.prepareStatement(
                "SELECT * FROM cng_pump WHERE email=? AND password=?"
            );
            ptmt.setString(1, email);
            ptmt.setString(2, pass);

            ResultSet rs = ptmt.executeQuery();
            if (rs.next()) {
                // ✅ Create session
                HttpSession session = request.getSession();
                int pumpId = rs.getInt("cng_id");
                String pumpName = rs.getString("pump_name");
                String district = rs.getString("district");
                String state = rs.getString("state");

                session.setAttribute("pumpId", pumpId);
                session.setAttribute("pumpName", pumpName);
                session.setAttribute("mobile", rs.getString("mobileNo"));
                session.setAttribute("district", district);
                session.setAttribute("state", state);
                session.setAttribute("price", rs.getBigDecimal("price_per_kg"));
                session.setAttribute("Address", rs.getString("address"));
                session.setAttribute("FullName", rs.getString("full_name"));
                session.setAttribute("city", rs.getString("city"));

                // ✅ Generate JWT
               
                String token = JWTUtils.generateToken(email ,"SELLER");

                // ✅ Store JWT in cookie
                Cookie jwtCookie = new Cookie("jwtToken", token);
                jwtCookie.setHttpOnly(true); // prevents JS access
                jwtCookie.setPath("/"); 
                jwtCookie.setMaxAge(24 * 60 * 60); // 1 day
                
         
                // Store JWT in cookie
               
                
                response.addCookie(jwtCookie);

                // Redirect to dashboard
                response.sendRedirect("Home1.jsp");
            } else {
            			
            	 HttpSession newSession = request.getSession();
 			     newSession.setAttribute("UserLoginError", "Invalid email or password");
 	             response.sendRedirect("Login.jsp");
               
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("500.html");
        }
    }
}
