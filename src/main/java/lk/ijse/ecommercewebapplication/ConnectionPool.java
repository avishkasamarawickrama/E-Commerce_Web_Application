
package lk.ijse.ecommercewebapplication;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionPool {

    private static DataSource dataSource;

    static {
        try {
            // Look up the DataSource from JNDI (container-managed resource)
            InitialContext context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/ecommerceDB");
        } catch (NamingException e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing the connection pool", e);
        }
    }

    /**
     * Get a connection from the connection pool.
     * @return a Connection object from the pool.
     */
    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * Get a connection from the pool.
     * @return a Connection object.
     * @throws SQLException if a database access error occurs.
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
