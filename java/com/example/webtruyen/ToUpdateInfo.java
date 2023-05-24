package com.example.webtruyen;

import java.io.*;
import java.util.List;

import dao.Dao;
import dao.EditTruyen;
import enbity.Category;
import enbity.Chapter;
import enbity.Truyen;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "helloServlet", value = "/update-truyen")
public class ToUpdateInfo extends HttpServlet {
    private Dao dao = new Dao();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Truyen truyen = dao.getByID(id);
            List<Category> cate = dao.getCategory();
            List<Category> cateB = dao.getCategoryByIdTruyen(id);
            List<Chapter> chapt = dao.getChapterByIdTruyen(id);
            request.setAttribute("info", truyen);
            request.setAttribute("listA", cate);
            request.setAttribute("listB", cateB);
            request.setAttribute("chap", chapt);
        } catch (NumberFormatException ex) {
            request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
        }
        request.getRequestDispatcher("jsp/Manage/updateInfo.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String tt = request.getParameter("tt");
        String gth = request.getParameter("gth");
        EditTruyen editTruyen = new EditTruyen();

        if(gth != null) {
            if(gth.equals("")) {
                request.setAttribute("nosuccess", "Not success!! Hãy điền đầy đủ thông tin tên truyện và tác giả; Không để trống thông tin giới thiệu");
            } else {
                editTruyen.updateIntro(gth, id);
            }
        }

        if (name.equals("") || author.equals("")) {
            request.setAttribute("nosuccess", "Not success!! Hãy điền đầy đủ thông tin tên truyện và tác giả; Không để trống thông tin giới thiệu");
            doGet(request, response);
        } else {
            editTruyen.updateInfo(id, name, author, tt);

            List<Category> cate = dao.getCategory();
            editTruyen.deleteCate(id);  //Xóa các thể loại cũ và thêm các thể loại mới
            for (int i = 0; i < cate.size(); i++) {
                int j = i + 1;
                String tl = "tl" + j;
                if (request.getParameter(tl) != null) {
                    editTruyen.updateCate(id, j);
                }
            }

            List<Chapter> chapList = dao.getChapterByIdTruyen(id);
            for (int i = 0; i < chapList.size(); i++) {
                String j = String.valueOf(i + 1);
                String nd = request.getParameter("nd" + j);
                String nameChap = request.getParameter("tenChap" + j);
                if(nd != null) {
                    editTruyen.updateNdChap(nd, id, j);
                }
                if(nameChap != null) {
                    editTruyen.updateNameChap(nameChap, id, j);
                }
            }

            request.setAttribute("success", "Update Success");

            // upload ảnh mới
            Part file = request.getPart("image");
            String imageFile = file.getSubmittedFileName();

            if (!imageFile.equals("")) {
                String uploadPath = "E:/LTweb/createWeb/webtruyen/src/main/webapp/imgs/" + imageFile;

                try {
                    FileOutputStream fos = new FileOutputStream(uploadPath);
                    InputStream is = file.getInputStream();

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                int row = new EditTruyen().UpdateImg(id, imageFile);
                String s = "";
                if (row <= 0) {
                    s = "Please upload file name less than 50 words";
                    request.removeAttribute("success");
                    request.setAttribute("nosuccess", s);
                }
            }
        }

        doGet(request, response);
    }

    public void destroy() {
    }


}