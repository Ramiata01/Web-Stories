package dao;

import connect.DBconnect;
import enbity.Category;
import enbity.Truyen;

import java.sql.*;

public class EditTruyen {
    public void updateInfo(int id, String name, String author, String trangthai) {
        int auth = updateAuthor(author);
        String sql = "UPDATE `webtruyen`.`truyen` SET `trang_thai` = " + trangthai +
                ", `name` = '" + name + "', `id_author` = '" + auth + "'\n" +
                "WHERE (`id_truyen` = "+ id +");";

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int updateAuthor(String auth) {
        String sql = "SELECT * FROM `webtruyen`.`author` where `name` = '" + auth + "'";
        int id = 0;
        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                id = rs.getInt(1);
            }
            else {
                try {
                    sql = "INSERT INTO `webtruyen`.`author` (`name`) VALUES ('" + auth + "')";
                    stmt.executeUpdate(sql);
                    sql = "SELECT * FROM `webtruyen`.`author` where `name` = '" + auth + "'";
                    rs = stmt.executeQuery(sql);
                    rs.next();
                    id = rs.getInt(1);
                    conn.close();

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            conn.close();
        } catch (SQLException ex) {

        }

        return id;
    }

    public void updateCate(int tr, int cate) {
        String sql = "INSERT INTO `webtruyen`.`truyen_category` (`id_truyen`, `id_category`) VALUES ('" + tr +"', '" + cate +"');";

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateIntro(String gth, int id) {
        String sql = "UPDATE `webtruyen`.`truyen` SET `introduce` = ? where truyen.id_truyen = ?";

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, gth);
            pstmt.setInt(2, id);

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int UpdateImg (int id, String imgUpdate) {
        Truyen truyen = null;
        int row = 0;
        String sql = "UPDATE `webtruyen`.`truyen` SET `image` = '" + imgUpdate + "' WHERE truyen.id_truyen =" + id;

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            row = stmt.executeUpdate(sql);

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    public void updateNdChap(String nd, int tr, String ch) {
        String sql = "UPDATE `webtruyen`.`chapter` SET `nd_chap` = ? WHERE (`id_truyen` = ? and `id_chapter` = ?)";

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nd);
            pstmt.setInt(2, tr);
            pstmt.setString(3, ch);

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNameChap(String name, int tr, String ch) {
        String sql = "UPDATE `webtruyen`.`chapter` SET `name` = ? WHERE (`id_truyen` = ? and `id_chapter` = ?)";

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, tr);
            pstmt.setString(3, ch);

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCate(int tr) {
        String sql = "DELETE FROM `webtruyen`.`truyen_category` WHERE (`id_truyen` = '" + tr + "')";

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTruyen(int tr) {
        String sql = "DELETE FROM `webtruyen`.`truyen` WHERE (`id_truyen` = '" + tr + "');";
        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        deleteCate(tr);
    }

    public static void main(String[] args) {
    }
}
