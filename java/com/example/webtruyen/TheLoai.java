package com.example.webtruyen;

import connect.DBconnect;
import dao.Dao;
import enbity.Category;
import enbity.Chapter;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/the-loai")
public class TheLoai extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Chapter> list = dao.getTruyenByCate(id);
            Category category = dao.getCatById(id);
            request.setAttribute("listA", list);
            request.setAttribute("nametl", category);
            request.getRequestDispatcher("jsp/TruyenByCate.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            response.sendRedirect("home");
        } catch (StringIndexOutOfBoundsException ex) {
            response.sendRedirect("home");
        }

    }
}
