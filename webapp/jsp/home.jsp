<%@ page import="dao.Dao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/11/2023
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đọc truyện online, đọc truyện hay</title>
    <link rel="stylesheet" href="css/home.css">

  <style>
    table {
      border-collapse: collapse;
        font-weight: 500;
        font-size: smaller;
    }

    td {
      border: 1px solid black;
      padding: 9px 8px;
      box-sizing: border-box;
    }

    td.nav {
      width: 355px;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="nd">
  <ul class="nav">
    <li class="tieude">TRUYỆN HOT</li>
    <li>
      <svg xmlns="http://www.w3.org/2000/svg" width="16" fill="currentColor" class="bi bi-fire" viewBox="0 0 16 16" style="height: 100%;">
        <path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z"/>
      </svg>
    </li>
  </ul>
  <ul class="nav anh">
    <c:forEach items="${listA}" var="a" end="15">
      <li class="truyen">
        <a class="item" href="page?id=${a.id}">
          <img style="width: 100%;" src="imgs/${a.img}">
          <label class="info white">${a.name}</label>
        </a>
      </li>
    </c:forEach>
  </ul>

  <ul class="nav">
    <li class="tieude">TRUYỆN MỚI CẬP NHẬT</li>
    <li>
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" style="height: 100%;">
        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
      </svg>
    </li>
  </ul>
  <table>
    <c:forEach items="${listB}" var="o">
      <tr>
        <td class="nav">
          <li>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" style="height: 100%">
              <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
            </svg>
          </li>
          <li><a href="page?id=${o.id}">${o.name}</a></li>
        </td>
        <td style="width: 200px">${o.img}</td>    <%--thay img -> thể loại--%>
        <td style="width: 164px;"><a style="color: var(--a-chang1)" href="doctruyen?tr=${o.id}&ch=${o.id_chap}">Chương ${o.id_chap}</a></td>
        <td style="width: 114px">${o.time} trước</td>
      </tr>
    </c:forEach>
  </table>
</div>

<script>
  setcolor(color);
</script>
</body>
</html>
