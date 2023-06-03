package dao;

import connect.DBconnect;
import enbity.Category;
import enbity.Chapter;
import enbity.Truyen;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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

    public List<Chapter> getTruyenByCate(int id_cate) {
        List<Chapter> chapterList = new ArrayList<>();
        String sql = "SELECT truyen.id_truyen, truyen.name, truyen.image, author.name, max(chapter.id_chapter) \n" +
                "FROM webtruyen.truyen, truyen_category as lk, category, author, chapter\n" +
                "where category.id_category = ? and truyen.id_truyen = lk.id_truyen and lk.id_category = category.id_category\n" +
                                "and truyen.id_author = author.id_author and truyen.id_truyen = chapter.id_truyen\n" +
                "group by truyen.id_truyen";
        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_cate);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String time = tinhTime(rs.getInt(1), rs.getString(5));
                chapterList.add(new Chapter(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), time));
            }
            Collections.sort(chapterList, new TimeComparator());
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chapterList;
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

    public List<Chapter> getLatestStories() {
        List<Chapter> list = new ArrayList<>();
        Truyen truyen = null;

        try {
            Connection conn = new DBconnect().getConnect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id_truyen, max(id_chapter) FROM webtruyen.chapter\n" +
                    "group by id_truyen");

            while (rs.next()) {
                int id_tr = rs.getInt(1);
                truyen = getByID(id_tr);
                String cate = listCateByIdTruyen(id_tr) + ",";
                String time = tinhTime(id_tr, rs.getString(2));
                list.add(new Chapter(rs.getInt(1),
                        truyen.getName(), cate.substring(0, cate.indexOf(",", cate.indexOf(",") + 1)),
                        rs.getString(2), time));
            }
            Collections.sort(list, new TimeComparator());   //sắp xếp theo tg sớm nhất
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String tinhTime(int tr, String ch) {
        String sql = "SELECT year(time), month(time), datediff(now(), time), hour(time), minute(time), second(time) \n" +
                "FROM webtruyen.chapter where id_truyen = ? and id_chapter = ?";
        Chapter chapter = null;

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, tr);
            stmt.setString(2, ch);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {
                Calendar c = Calendar.getInstance();
                int year = c.get(Calendar.YEAR) - rs.getInt(1);
                if (year != 0) return year + " năm";

                // Trả về giá trị từ 0 - 11
                int month = (c.get(Calendar.MONTH) + 1) - rs.getInt(2);
                if (month != 0) return month + " tháng";

                int day = rs.getInt(3);
                if (day != 0) return day + " ngày";

                int hour = c.get(Calendar.HOUR_OF_DAY) - rs.getInt(4);
                if (hour != 0) return hour + " giờ";

                int minute = c.get(Calendar.MINUTE) - rs.getInt(5);
                if (minute != 0) return minute + " phút";

                int second = c.get(Calendar.SECOND) - rs.getInt(6);
                if (second != 0) return second + " giây";
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "";
    }

    public static void main(String[] args) {
        String tk = "%" + "linh" + "%";
        String sql = "SELECT truyen.id_truyen, truyen.name, truyen.image, author.name, max(chapter.id_truyen) FROM webtruyen.author, truyen, chapter\n" +
                "where author.id_author = truyen.id_author and chapter.id_truyen = truyen.id_truyen and (author.name like ? or truyen.name like ?) \n" +
                "group by author.id_author, truyen.id_truyen";
        List<Chapter> chapterList = new ArrayList<>();

        try {
            Connection conn = new DBconnect().getConnect();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tk);
            stmt.setString(2, tk);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getString(2));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
