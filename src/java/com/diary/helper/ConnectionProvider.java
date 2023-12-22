package com.diary.helper;

import java.sql.*;

public class ConnectionProvider {

    public static Connection con;

    public static Connection getConn() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairy", "root", "1234");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
