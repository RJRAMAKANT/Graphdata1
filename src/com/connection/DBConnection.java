package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con = null;

    private DBConnection() {
        // Private constructor to prevent instantiation
    }

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://10.2.10.48:3306/hbsr_online_new", "root", "root");
            System.out.println("Database Connected");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getcon() {
        return con;
    }
}
