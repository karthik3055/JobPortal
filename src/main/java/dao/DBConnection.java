//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class DBConnection {
//
//    public static Connection getConnection() {
//
//        Connection con = null;
//
//        try {
//
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            con = DriverManager.getConnection(
//                "jdbc:mysql://localhost:3306/jobportal",
//                "root",
//                "pass"
//            );
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return con;
//    }
//}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String url =
                "jdbc:mysql://jobportal-db-karthik-3b11.d.aivencloud.com:15382/defaultdb?sslMode=REQUIRED";

            String password =
                System.getenv("DB_PASSWORD");

            return DriverManager.getConnection(
                url,
                "avnadmin",
                password
            );

        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}