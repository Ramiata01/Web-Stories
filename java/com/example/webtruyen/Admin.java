package com.example.webtruyen;

import dao.Dao;
import dao.EditTruyen;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class Admin extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tr = request.getParameter("id");
        if(tr != null) {
            int id = Integer.parseInt(tr);
            new EditTruyen().deleteTruyen(id);
        }
        List<Truyen> listA = new Dao().getAll();
        request.setAttribute("listA", listA);
        request.getRequestDispatcher("./jsp/Manage/admin.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
