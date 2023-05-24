package dao;

import connect.DBconnect;
import enbity.Category;
import enbity.Chapter;
import enbity.Truyen;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Dao {
    Connection conn = new DBconnect().getConnect();
    public List<Truyen> getAll() {
        List<Truyen> truyenList = new ArrayList<>();
        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM webtruyen.truyen");

            while (rs.next()) {
                Truyen truyen = new Truyen(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(8));
                truyenList.add(truyen);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return truyenList;
    }
    public Truyen getByID(int id) {
        Truyen truyen = null;
        String sql = "SELECT * FROM webtruyen.truyen, author\n" +
                "where truyen.id_author = author.id_author and truyen.id_truyen =" + id;

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                truyen = new Truyen(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(10),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return truyen;
    }

    public List<Category> getCategory() {
        List<Category> categoryList = new ArrayList<>();
        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM webtruyen.category;");

            while (rs.next()) {
                Category category = new Category(rs.getInt(1),
                        rs.getString(2));
                categoryList.add(category);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    public Category getCatById(int id) {
        Category category = null;
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM webtruyen.category where category.id_category = " + id);

            while (rs.next()) {
                category = new Category(rs.getInt(1),
                        rs.getString(2));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    public List<Category> getCategoryByIdTruyen(int id) {
        String sql = "SELECT category.id_category, category.name FROM webtruyen.truyen, truyen_category as lk, category \n" +
                "where truyen.id_truyen =" + id + " and truyen.id_truyen = lk.id_truyen and lk.id_category = category.id_category";
        List<Category> categoryList = new ArrayList<>();

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                categoryList.add(new Category(rs.getInt(1), rs.getString(2)));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList; //khong lay dau phay cuoi cung
    }

    public String listCateByIdTruyen(int id) {
        String categoryList = "";
        List<Category> list = getCategoryByIdTruyen(id);
        for (Category c: list) {
            categoryList += c.getName() + ", ";
        }
        return categoryList.substring(0, categoryList.length() - 2); //khong lay dau phay cuoi cung
    }

    public List<Truyen> getTruyenByCate(int id_cate) {
        List<Truyen> truyenList = new ArrayList<>();
        String sql = "SELECT * FROM webtruyen.truyen, truyen_category as lk, category, author\n" +
                "where category.id_category ="  + id_cate + " and truyen.id_truyen = lk.id_truyen and lk.id_category = category.id_category\n" +
                "and truyen.id_author = author.id_author";
        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                truyenList.add(new Truyen(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(8),
                        rs.getString(14)));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return truyenList;
    }

    public List<Chapter> getChapterByIdTruyen (int id) {
        List<Chapter> chapterList = new ArrayList<>();
        String sql = "SELECT chapter.* FROM webtruyen.chapter, webtruyen.truyen " +
                "where truyen.id_truyen = chapter.id_truyen and truyen.id_truyen = " + id;

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Chapter chapter = new Chapter(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
                chapterList.add(chapter);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chapterList;
    }

    public Chapter getNdChap (int tr, String chap) {
        String sql = "SELECT * FROM webtruyen.chapter where id_truyen = " + tr + " and id_chapter =" + chap;
        Chapter chapter = null;

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                chapter = new Chapter(rs.getString(1), rs.getString(2), rs.getString(3));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chapter;
    }

    public static void main(String[] args) {
//        List<Chapter> chapters = new Dao().getChapterByIdTruyen(1);
//        for (Chapter c: chapters) {
//            System.out.println(c.getTenChuong());
//        }
    }
}
