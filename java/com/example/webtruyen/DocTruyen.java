package com.example.webtruyen;

import dao.Dao;
import enbity.Chapter;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctruyen")
public class DocTruyen extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();

        try {
            int tr = Integer.parseInt(request.getParameter("tr"));
            String ch = request.getParameter("ch");
            Chapter chapter = dao.getNdChap(tr, ch);
            Truyen truyen = dao.getByID(tr);
            List<Chapter> chapterList = dao.getChapterByIdTruyen(tr);
            request.setAttribute("nd", chapter);
            request.setAttribute("tr", truyen);
            request.setAttribute("listC", chapterList);
            request.setAttribute("sl", chapterList.size());

            request.getRequestDispatcher("jsp/ndTruyen.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            response.sendRedirect("home");
        } catch (StringIndexOutOfBoundsException ex) {
            response.sendRedirect("home");
        }

    }
}
