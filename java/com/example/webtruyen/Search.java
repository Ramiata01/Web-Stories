package com.example.webtruyen;

import connect.DBconnect;
import enbity.Chapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet("/tim-kiem")
public class Search extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tk = "%" + request.getParameter("search") + "%";
        String sql = "SELECT truyen.id_truyen, truyen.name, truyen.image, author.name, max(chapter.id_chapter) FROM webtruyen.author, truyen, chapter\n" +
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
                chapterList.add(new Chapter(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), ""));
            }
            conn.close();
            request.setAttribute("list", chapterList);
            request.getRequestDispatcher("jsp/search.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
