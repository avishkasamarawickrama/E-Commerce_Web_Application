package lk.ijse.ecommercewebapplication.Util;

import java.sql.*;

public class DBConnection {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    private static Connection connection;


    private DBConnection() {
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        }
        return connection;
    }

}
