<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/14/2023
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="header.jsp"></jsp:include>

    <style>
        .nd .tieude {
            width: fit-content;
            font-weight: 500;
            font-size: large;
            padding: 7px 2px 7px 0;
            border-bottom: solid var(--color) 1px;
        }

        .nd .nav {
            display: grid;
            grid-template-columns: 208px 465px 139px;
            grid-auto-rows: 89px;
        }

        .nd .nav .item1 {
            width: 182px;
            height: 82px;
            object-fit: cover;
        }

        .nd .nav .item2 {
            margin-top: auto;
            margin-bottom: auto;
        }

        .nd .nav .item2 .ten {
            font-size: large;
            font-weight: 700;
        }

        .icon {
            margin-bottom: 5px;
        }

        .link {
            color: var(--color-link);
            text-decoration: none;
            letter-spacing: -0.5px;
        }

        .link:hover {
            text-decoration: underline black;
        }
    </style>
</head>
<body>

<div class="nd">
    <p class="tieude">TRUYỆN ${nametl.name.toUpperCase()}</p>
    <ul class="nav">
        <c:forEach items="${listA}" var="a">
            <div><img class="item1" src="imgs/${a.img}"></div>
            <div class="item2">
                <div class="ten">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-journal-bookmark-fill icon" viewBox="0 0 18 18">
                        <path fill-rule="evenodd"
                              d="M6 1h6v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8V1z"/>
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                    </svg>
                    <a class="link" href="page?id=${a.id}">${a.name}</a>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-pencil-fill icon" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                    </svg>
                    <i>${a.author}</i>
                </div>
            </div>
            <div class="item 3">Chương</div>
        </c:forEach>
    </ul>
</div>

<script>
    let name = "${nametl.name}";
    console.log(name);
    document.getElementById("header_bottom").innerHTML = '<a onmouseover="changcolor(this)" onmouseout="normalcolor(this)" style="text-decoration: none; color: black;" href="index.jsp">Truyện </a>/ ' +
        '<a onmouseover="changcolor(this)" onmouseout="normalcolor(this)" style="text-decoration: none; color: black;" href="the-loai?id=${nametl.id}">'+ name + '</a>';
    function changcolor(x) {
        x.style.color = "gray";
    }
    function normalcolor(x) {
        x.style.color = "black"
    }
</script>
</body>
</html>
