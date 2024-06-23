/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dal;

/**
 *
 * @author NGHIA
 */
import java.sql.Connection;
import java.sql.DriverManager;
public class DBContext {
    private final String serverName = "DESKTOP-GJNHNQU";
    private final String dbName = "ql_noithat";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    public void testConnection() {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        dbContext.testConnection();
    }
}