package connect;

import java.sql.*;

public class DBconnect {
    public Connection getConnect() {
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/webtruyen";
        String user = "thuyle";
        String pass = "thuyle12345";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,pass);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM webtruyen.author;");

            while (rs.next()) {
                System.out.println(rs.getInt(1) + " " +
                        rs.getString(2));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
