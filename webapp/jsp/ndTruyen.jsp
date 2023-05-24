<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/20/2023
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${tr.name} - ${nd.tenChuong}</title>
    <jsp:include page="header.jsp"></jsp:include>
    <link rel="stylesheet" href="css/ndChap.css">
</head>
<body>
<jsp:useBean id="a" class="dao.Thembr"></jsp:useBean>
<c:set var="pre" value="0"></c:set>
<c:if test="${nd.id_chap == '1' || nd.id_chap == '1-1'}">
    <c:set var="pre" value="1"></c:set>
</c:if>

<div class="nd">
    <div class="td">${tr.name.toUpperCase()}</div>
    <div style="text-align: center;">Chương ${nd.id_chap}: ${nd.tenChuong}</div>
    <div class="tachdong-top"></div>
    <div style="text-align: center">
        <button class="bt-chuong left" onclick="prevchap()" <c:if test="${pre == 1}">disabled</c:if>>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left icon" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path>
            </svg>
            Chương trước
        </button>
        <button class="bt-chuong" style="width: 62px;" id="nutlist" onclick="showandhidden('listchap', 'nutlist')">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="48" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"></path>
                <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"></path>
            </svg>
        </button>
        <select class="bt-chuong" id="listchap" name="listchap" onchange="chuyenchap(this)" style="width: 205px; padding: 0 20px;" hidden="hidden">
            <c:forEach items="${listC}" var="o">
                <option value="${o.id_chap}" <c:if test="${o.id_chap == nd.id_chap}">selected</c:if>>Chương ${o.id_chap}</option>
            </c:forEach>
        </select>

        <button class="bt-chuong right" onclick="nextchap()" <c:if test="${sl == nd.id_chap}">disabled</c:if>>
            Chương tiếp
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right icon" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
            </svg>
        </button>
    </div>
    <div class="tachdong-bottom"></div>

    <div class="kv_truyen">${a.nhiphan_word(nd.nd)}</div>

    <div class="tachdong-bottom"></div>
    <div style="text-align: center">
        <button class="bt-chuong left" onclick="prevchap()" <c:if test="${pre == 1}">disabled</c:if>>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left icon" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path>
            </svg>
            Chương trước
        </button>
        <button class="bt-chuong" style="width: 62px;" id="nutlist2" onclick="showandhidden('listchap2', 'nutlist2')">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="48" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"></path>
                <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"></path>
            </svg>
        </button>
        <select class="bt-chuong" id="listchap2" name="listchap" onchange="chuyenchap(this)" style="width: 205px; padding: 0 20px;" hidden="hidden">
            <c:forEach items="${listC}" var="o">
                <option value="${o.id_chap}" <c:if test="${o.id_chap == nd.id_chap}">selected</c:if>>Chương ${o.id_chap}</option>
            </c:forEach>
        </select>
        <button class="bt-chuong right" onclick="nextchap()" <c:if test="${sl == nd.id_chap}">disabled</c:if>>
            Chương tiếp
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right icon" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
            </svg>
        </button>
    </div>
</div>

<script>
    let head_bottom = document.getElementById("header_bottom");
    let ndhead = '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none; color: var(--color)" href="index.jsp">Truyện </a>/ ';
    let name = "${tr.name}";
    let chuong = "Chương ${nd.id_chap}: ${nd.tenChuong}";
    head_bottom.style.backgroundColor = "rgb(236,236,236)";
    head_bottom.innerHTML = ndhead +
    '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none; color: var(--color)" href="page?id=${tr.id}">'+ name + ' </a>/ ' +
    '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none; color: var(--color)" href="doctruyen?tr=${tr.id}&ch=${nd.id_chap}">'+ chuong + '</a>';

    document.getElementById("header").style.position = "relative";

    let chap = "${nd.id_chap}";
    function prevchap() {
        let tru = Number(chap.slice(-1)) - 1;
        let url = "doctruyen?tr=${tr.id}&ch=" + chap.slice(0, chap.length -1) + tru;
        window.location = url;
    }
    function nextchap() {
        let cong = Number(chap.slice(-1)) + 1;
        let url = "doctruyen?tr=${tr.id}&ch=" + chap.slice(0, chap.length -1) + cong;
        window.location = url;
    }
    function chuyenchap(x) {
        let url = "doctruyen?tr=${tr.id}&ch=" + x.value;
        window.location = url;
    }
    function showandhidden(x, y) {
        document.getElementById(x).hidden = false;
        document.getElementById(y).hidden = true;
    }
</script>
</body>
</html>
