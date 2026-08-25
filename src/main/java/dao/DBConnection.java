package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String database = System.getenv("DB_NAME");
            String username = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            String url = "jdbc:mysql://" + host + ":" + port + "/" + database
                       + "?sslMode=REQUIRED";

            return DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}