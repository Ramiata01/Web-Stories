<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/16/2023
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

  <style>

    .buton {
      position: fixed;
      left: 80%;
    }

    table, td, th {border: 1px solid green}

    table {
      width: 1000px;
    }
  </style>

  <script>
    function deleteTr(id) {
      ${e.deleteCate(id)}
    }
  </script>
</head>
<body>
  <jsp:useBean id="c" class="dao.Dao" scope="request"></jsp:useBean>
  <jsp:useBean id="e" class="dao.EditTruyen" scope="request"></jsp:useBean>
  <div class="buton">
    <a href="index.jsp">
      <button>Trang Chủ</button>
    </a>
    <a href="jsp/Manage/addTruyen.jsp">
      <button>Thêm truyện</button>
    </a>
  </div>
<table>
  <tr>
    <th>id</th>
    <th>Ten Truyen</th>
    <th>Img</th>
    <th>Tac Gia</th>
    <th>The Loai</th>
    <th>Trang thai</th>
    <th></th>
    <th></th>
  </tr>
  <c:forEach items="${listA}" var="o">
    <tr>
      <td>${o.id}</td>
      <td>${o.name}</td>
      <td><img src="./imgs/${o.img}" style="height: 150px;"></td>
      <td>${c.getByID(o.id).author}</td>
      <td>${c.listCateByIdTruyen(o.id)}</td>
      <td>${c.getByID(o.id).trangthai}</td>
      <td><a href="jsp/Manage/addChapter.jsp?id=${o.id}">Add Chapter</a></td>
      <td style="width: 100px;">
        <a href="update-truyen?id=${o.id}">Edit </a>
        /
        <a href="admin?id=${o.id}">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
