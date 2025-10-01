package com.DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection connect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cng_booking?useSSL=false&serverTimezone=UTC",
                "root",  // MySQL username
                "root"   // MySQL password
            );
        } catch (Exception e) {
            e.printStackTrace();  // This will print the real connection error
        }
        return con;
    }
}
