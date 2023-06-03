package com.example.webtruyen;

import java.io.*;
import java.util.List;

import dao.Dao;
import dao.InsertTruyen;
import enbity.Category;
import enbity.Chapter;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet("/page")
public class ToPageTruyen extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Truyen truyen = dao.getByID(id);
//            String cate = dao.listCateByIdTruyen(id);
            List<Category> cates = dao.getCategoryByIdTruyen(id);
            List<Chapter> chapt = dao.getChapterByIdTruyen(id);
            request.setAttribute("info", truyen);
            request.setAttribute("cate", cates);
            request.setAttribute("chap", chapt);
            request.getRequestDispatcher("jsp/PageTruyen.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            response.sendRedirect("home");
        } catch (StringIndexOutOfBoundsException ex) {
            response.sendRedirect("home");
        }
    }

// Post từ addChapter.jsp
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            int next = new Dao().getChapterByIdTruyen(id).size() + 1;

            for (int i = next; i < next + 6; i++) {
                String so = "so" + i, na = "na" + i, nd = "nd" + i;
                String nameChap = request.getParameter(na);
                if(nameChap != null) {
                    String ndChap = request.getParameter(nd);
                    new InsertTruyen().addChap(String.valueOf(i), nameChap, ndChap, id);
                }
            }
            response.sendRedirect("admin");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
}
