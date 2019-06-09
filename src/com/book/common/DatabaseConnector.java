package com.book.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    static String ip = "127.0.0.1";
    static String dbName = "book";
    static String username = "root";
    static String password = "yostar";
    static Connection conn = null;
    public DatabaseConnector() {
    }

    public static Connection connect() {

        String url = "jdbc:mysql://" + ip + "/" + dbName + "?useUnicode=true&characterEncoding=utf8&useSSL=false";

        try {
            if (conn == null) {
                conn = DriverManager.getConnection(url, username, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }
}
