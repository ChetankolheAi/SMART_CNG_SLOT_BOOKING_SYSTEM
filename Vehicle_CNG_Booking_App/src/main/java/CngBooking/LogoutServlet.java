package CngBooking;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet") 
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Invalidate session
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate();
        }

        // ✅ Remove JWT cookie
        Cookie jwtCookie = new Cookie("jwtToken", "");
        jwtCookie.setPath("/"); 
        jwtCookie.setMaxAge(0);
        response.addCookie(jwtCookie);
        
        Cookie jwtCookie1 = new Cookie("pumpJwtToken", "");
        jwtCookie1.setHttpOnly(true); // prevents JS access
        jwtCookie1.setPath("/"); 
        jwtCookie1.setMaxAge(0); // 1 day
        response.addCookie(jwtCookie1);
        
        Cookie jwtCookie12 = new Cookie("AdminjwtToken", "");
        jwtCookie12.setHttpOnly(true); // prevents JS access
        jwtCookie12.setPath("/"); 
        jwtCookie12.setMaxAge(0); // 1 day
        response.addCookie(jwtCookie12);
        // ✅ Create a new session only to store logout message
        HttpSession newSession = request.getSession();
        newSession.setAttribute("logoutMsg", "Successfully logged out");

        // ✅ Redirect once (important: only one redirect!)
        response.sendRedirect("Home1.jsp");
    }
}
