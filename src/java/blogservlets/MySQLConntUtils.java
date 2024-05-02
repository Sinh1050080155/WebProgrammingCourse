package blogservlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConntUtils {

    public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException {
        String dbName = "programmingcourse";
        String username = "root";
        String password = "Nps12345";
        return getMySQLConnection(dbName, username, password);
    }

    private static Connection getMySQLConnection(String dbName, String username, String password)
            throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String connectionURL = "jdbc:mysql://localhost:3306/" + dbName;

        return DriverManager.getConnection(connectionURL, username, password);
    }
}
