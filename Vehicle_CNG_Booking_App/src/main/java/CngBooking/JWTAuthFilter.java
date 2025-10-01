package CngBooking;

import io.jsonwebtoken.Claims;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class JWTAuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String token = null;

        // First check Authorization header
        String authHeader = req.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            token = authHeader.substring(7);
        }

        // If not present, check cookies
        if (token == null && req.getCookies() != null) {
            for (Cookie cookie : req.getCookies()) {
                if ("jwtToken".equals(cookie.getName())) {
                    token = cookie.getValue();
                    break;
                }
            }
        }

        if (token != null) {
            try {
                Claims claims = JWTUtils.validateToken(token);

                // Attach claims to request (so JSP/Servlet can use)
                req.setAttribute("email", claims.getSubject());
                req.setAttribute("role", claims.get("role"));
       // only if you add it in token

                chain.doFilter(request, response); // continue
                return;
            } catch (Exception e) {
                // Token invalid or expired
                res.sendRedirect("Login.jsp?error=Session expired");
                return;
            }
        }

        // No token
        res.sendRedirect("Login.jsp?error=Please login");
    }
}
