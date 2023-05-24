<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/11/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${info.name}</title>
    <link rel="stylesheet" href="css/pagetruyen.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<script>
    function chang_height() {
        document.getElementById("item2").style.height = "fit-content";
        document.getElementById("nut").innerHTML = "";
    }
</script>

<jsp:useBean id="a" class="dao.Thembr"></jsp:useBean>
<c:set var="row" value="2"></c:set>

<div class="nd">
    <ul class="nav">
        <li class="tieude">THÔNG TIN TRUYỆN</li>
        <li>
            <div>
                <img class="img" src="imgs/${info.img}">
            </div>
            <div style="font-size: small; margin-top: 27px;">
                <div><b>Tác giả: </b> ${info.author}</div>
                <div><b>Thể loại: </b>${cate}</div>
                <div>
                    <b>Trạng thái: </b>
                    <c:choose>
                        <c:when test="${info.trangthai == 0}">
                            <label style="color: dodgerblue">Đang ra</label>
                        </c:when>
                        <c:otherwise>
                            <label style="color: green">Full</label>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </li>
        <li>
            <div class="item1" id="name">${info.name.toUpperCase()}</div>
            <div class="item2" id="item2">${a.nhiphan_word(info.introduce)}</div>
            <div style="position: relative" id="nut">
                <button class="item3" onclick="chang_height()">
                    Xem thêm
                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor"
                         class="bi bi-chevron-double-right" style="margin-bottom: 3px;" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                        <path fill-rule="evenodd"
                              d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </button>
            </div>
        </li>
    </ul>
    <ul class="nav nav2" style="margin-top: 16px">
        <li class="tieude">DANH SÁCH CHƯƠNG</li>
        <c:forEach items="${chap}" var="o">
            <c:choose>
                <c:when test="${o.id_chap < 26}">
                    <li style="margin-left: 30px; grid-column: 1/2">
                </c:when>
                <c:otherwise>
                    <li style="margin-left: 30px; grid-column: 1/2; grid-row: ${row}"
                    <c:set var="row" value="${row + 1}"></c:set>
                </c:otherwise>
            </c:choose>
                        <svg xmlns="http://www.w3.org/2000/svg" style="margin-bottom: 1px;" width="12" height="12" fill="currentColor" class="bi bi-sun-fill" viewBox="0 0 16 16">
                            <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                        </svg>
                        <a href="doctruyen?tr=${info.id}&ch=${o.id_chap}" class="item">Chương ${o.id_chap}: ${o.tenChuong}</a>
                    </li>
        </c:forEach>
    </ul>

</div>
<script>
    let name = "${info.name}";
    let ndhead = '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none; color: var(--color)" href="index.jsp">Truyện </a>/ ';
    document.getElementById("header_bottom").innerHTML = ndhead +
        '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none; color: gray" href="page?id=${info.id}">'+ name + '</a>';

</script>

</body>
</html>
