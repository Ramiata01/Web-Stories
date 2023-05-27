package com.example.webtruyen;

import java.io.*;
import java.util.List;

import dao.Dao;
import enbity.Chapter;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loadtruyen", value = "/home")
public class ToHome extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Dao dao = new Dao();
        List<Truyen> listA = dao.getAll();
        List<Chapter> listB = dao.getLatestStories();
        request.setAttribute("listA", listA);
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
    }
}
