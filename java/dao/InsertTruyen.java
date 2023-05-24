package dao;

import connect.DBconnect;
import enbity.Chapter;

import java.sql.*;

public class InsertTruyen {

    public int addInfo(String name, String author, String trangthai, String gth) {
        int id = new Dao().getAll().size() + 1;
        int auth = new EditTruyen().updateAuthor(author);
        String sql = "INSERT INTO `webtruyen`.`truyen` (`id_truyen`, `name`, `introduce`, `id_author`, `trang_thai`) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, gth);
            pstmt.setInt(4, auth);
            pstmt.setString(5, trangthai);

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id;
    }

    public void addChap(String idchap, String name, String nd, int tr) {
        String sql = "INSERT INTO `webtruyen`.`chapter` (`id_chapter`, `name`, `nd_chap`, `id_truyen`, `time`) VALUES (?, ?, ?, ?, now())";

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idchap);
            pstmt.setString(2, name);
            pstmt.setString(3, nd);
            pstmt.setInt(4, tr);

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
    }
}
