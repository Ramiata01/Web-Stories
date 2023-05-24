<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/4/2023
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/header.css">
    <script src="JavaScript/header.js"></script>

    <style>
        .header {
            z-index: 1;
        }
    </style>

    <script>
        function changcolorall(x) {
            console.log(x.innerHTML);
            let d = new Date();
            d.setTime(d.getTime() + (24*60*60*1000));
            let expires = "expires="+d.toUTCString();
            document.cookie = "color=" + x.value + "; " + expires;
            setcolor(x);
        }

        function getCookie(cname) {
            let name = cname + "=";
            let ca = document.cookie.split(';');
            for(let i=0; i<ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
            }
            return "";
        }

        function setcolor(x) {
            let color = getCookie("color")
            if(color == "black") {
                document.querySelector("body").style.backgroundColor = "var(--background-color-toi)";
                document.querySelector("body").style.color = "var(--colortoi)";
                document.querySelector(".header .top").style.backgroundColor = "var(--background-color-headertoi)";
                document.querySelector(".header .bottom").style.backgroundColor = "var(--background-color-headerbottomtoi)";
                x.options[1].selected = true;
            }else if(color == "" || color == "action") {
                document.querySelector("body").style.backgroundColor = "var(--background-color)";
                document.querySelector("body").style.color = "var(--color)";
                document.querySelector(".header .top").style.backgroundColor = "var(--background-color-header)";
                document.querySelector(".header .bottom").style.backgroundColor = "var(--background-color-headerbottom)";
                document.querySelector(".header .bottom").style.backgroundColor = "var(--background-color-headerbottom)";
                x.options[0].selected = true;
            }
        }
    </script>
</head>
<body>
<div class="header" id="header">
    <div class="top">
        <a href="index.jsp">
            <img class="logo" src="https://static.8cache.com/img/spriteimg_new_white_op.png">
        </a>
        <ul class="nav" style="margin-left: 17.3%;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                   aria-expanded="false">Danh sách</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Truyện mới cập nhật</a></li>
                    <li><a class="dropdown-item" href="#">Truyện Hot</a></li>
                    <li><a class="dropdown-item" href="#">Truyện Full</a></li>
                    <li><a class="dropdown-item" href="#">Tiên Hiệp Hay</a></li>
                    <li><a class="dropdown-item" href="#">Kiếm Hiệp Hay</a></li>
                    <li><a class="dropdown-item" href="#">Truyện Teen Hay</a></li>
                    <li><a class="dropdown-item" href="#">Ngôn Tình Hay</a></li>
                    <li><a class="dropdown-item" href="#">Ngôn Tình Ngược</a></li>
                    <li><a class="dropdown-item" href="#">Ngôn Tình Sủng</a></li>
                    <li><a class="dropdown-item" href="#">Ngôn Tình Hài</a></li>
                    <li><a class="dropdown-item" href="#">Đam Mỹ Hài</a></li>
                    <li><a class="dropdown-item" href="#">Đam Mỹ Hay</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                   aria-expanded="false">Thể loại</a>
                <ul class="dropdown-menu">
                    <jsp:useBean id="i" class="dao.Dao" scope="request"></jsp:useBean>
                    <c:forEach items="${i.category}" var="o">
                        <li><a class="dropdown-item" href="the-loai?id=${o.id}">${o.name}</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                   aria-expanded="false">Phân loại theo Chương</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Dưới 100 chương</a></li>
                    <li><a class="dropdown-item" href="#">100 - 500 chương</a></li>
                    <li><a class="dropdown-item" href="#">500 - 1000 chương</a></li>
                    <li><a class="dropdown-item" href="#">Trên 1000 chương</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                   aria-expanded="false">Tùy chỉnh</a>
                <ul class="dropdown-menu">
                    <li class="dropdown-item">
                        <label style="margin-right: 10px; font-size: smaller">Màu nền</label>
                        <select style="font-size: small" id="color" onchange="changcolorall(this)">
                            <option value="action">Xám nhạt</option>
                            <option value="black">Màu tối</option>
                        </select>
                    </li>
                </ul>
            </li>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>
            </form>
        </ul>
    </div>
    <div class="bottom" id="header_bottom">
        Đọc truyện online, đọc truyện chữ, truyện full, truyện hay. Tổng hợp đầy đủ và cập nhật liên tục.
    </div>
</div>

<script>
    let color = document.getElementById("color");
    // if(color.value == "black") {
    //     document.querySelector("body").style.backgroundColor = "var(--background-color-toi)";
    // }else {
    //     document.querySelector("body").style.backgroundColor = "var(--background-color)";
    // }
    setcolor(color);


</script>
</body>
</html>
