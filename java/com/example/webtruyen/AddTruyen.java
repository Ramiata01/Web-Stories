package com.example.webtruyen;

import dao.Dao;
import dao.EditTruyen;
import dao.InsertTruyen;
import enbity.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet("/add-truyen")
public class AddTruyen extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String tt = request.getParameter("tt");
        String gth = request.getParameter("gth");
        InsertTruyen insertTruyen = new InsertTruyen();

        int id = insertTruyen.addInfo(name, author, tt, gth);

        List<Category> cate = new Dao().getCategory();
        for (int i = 0; i < cate.size(); i++) {
            int j = i + 1;
            String tl = "tl" + j;
            if (request.getParameter(tl) != null) {
                new EditTruyen().updateCate(id, j);
            }
        }

        new ToUpdateInfo().uploadImg(request, "image", id);

        request.getRequestDispatcher("admin").forward(request, response);

    }
}
