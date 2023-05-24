package com.example.webtruyen;

import java.io.*;
import java.util.List;

import dao.Dao;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loadtruyen", value = "/home")
public class ToHome extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        Dao dao = new Dao();
        List<Truyen> listA = dao.getAll();
        request.setAttribute("listA", listA);
        session.setAttribute("color_sang", 1);
        session.setAttribute("color_toi", 0);
        request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
    }
}
