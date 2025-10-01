package CngBooking;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class JWTUtils {
    private static final String SECRET = "MySuperSecretKeyThatIsAtLeast32BytesLong";
    private static final long EXPIRATION_TIME = 1000 * 60 * 60; // 1 hour

    // Generate token with email + role
    public static String generateToken(String email, String role) {
        return Jwts.builder()
                .setSubject(email) // email = subject
                .claim("role", role) // extra claim
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS256, SECRET.getBytes())
                .compact();
    }

    // Validate token and return Claims
    public static Claims validateToken(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET.getBytes())
                .parseClaimsJws(token)
                .getBody();
    }
}
