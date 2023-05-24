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
    <title>Đọc truyện online</title>
    <link rel="stylesheet" href="css/home.css">
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
    <%--       load các truyện có trong db         --%>
    <c:forEach items="${listA}" var="a">
      <li class="truyen">
        <a class="item" href="page?id=${a.id}">
          <img style="width: 100%;" src="imgs/${a.img}">
          <label class="info">${a.name}</label>
        </a>
      </li>
    </c:forEach>
  </ul>
</div>
</body>
</html>
