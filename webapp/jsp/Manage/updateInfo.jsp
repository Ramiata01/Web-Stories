<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        .head {
            background-color: rosybrown;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .nav {
            display: grid;
            grid-template-columns: 150px 250px 600px auto;
            grid-gap: 25px 15px;
        }

        .nav .item1 {
            grid-column: 1/2;
        }

        .nav .item2 {
            grid-column: 2/3;
        }

        .nav .item2.it {
            display: grid;
            grid-template-columns: auto auto;
        }

        .khungchuong {
            display: grid;
            grid-template-columns: auto auto;
        }

        .khungchuong .chuong {
            padding: 5px 10px;
            cursor: default;
        }

        .khungchuong .chuong:hover {
            text-decoration: underline;
        }

        label {
            font-weight: bold
        }
    </style>

    <script>
        function checkbox(check, ktr) {
            let thu = ktr;
            for (let i = 0; i < check.length; i++) {
                if (check[i].value == thu) {
                    check[i].checked = true
                }
            }
        }
    </script>
</head>
<body> <%--servet: Helloservlet--%>

<div class="head">UPDATE STORY</div>
<p style="color: dodgerblue">${success}</p>
<p style="color: red">${nosuccess}</p>
<form action="update-truyen?id=${info.id}" method="post" enctype="multipart/form-data" class="nav">
    <label class="item1">Ten Truyen: </label>
    <input class="item2" name="name" type="text" value="${info.name}" size="30">

    <label class="item1">Tac gia: </label>
    <input name="author" type="text" value="${info.author}">

    <label class="item1">Trang thai:</label>
    <div class="item2">
        <input name="tt" type="radio" value="0"> Chua hoan thanh <br>
        <input name="tt" type="radio" value="1"> Full
    </div>

    <label class="item1">The loai:</label>
    <div class="item2 it">
        <c:forEach items="${listA}" var="o">
            <c:set var="test" value="0"></c:set>
            <c:forEach items="${listB}" var="b">
                <c:if test="${o.id == b.id}">
                    <div><input name="tl${o.id}" type="checkbox" checked> ${o.name}</div>
                    <c:set var="test" value="1"></c:set>
                </c:if>
            </c:forEach>
            <c:if test="${test == 0}">
                <div><input name="tl${o.id}" type="checkbox"> ${o.name}</div>
            </c:if>
        </c:forEach>
    </div>

    <label class="item1">Phần giới thiệu:</label>
    <input type="button" style="width: 200px; height: 30px" value="Click để xem" onclick="showgth()">
    <textarea style="grid-column: 1/3" id="gth" rows="30" cols="70" hidden="hidden">${info.getIntroduce()}</textarea>

    <label class="item1">Thay doi anh: </label>
    <input class="item2" type="file" name="image" accept="image/png, image/jpeg, image/jpe">

    <div style="grid-column: 3/4; grid-row: 1/9;">
        <label>Nhấn vào chương để sửa: </label>
        <div class="khungchuong">
            <c:set var="test" value="1"></c:set>
            <c:forEach items="${chap}" var="o">
                <div class="chuong" onclick="shownd(${o.id_chap})" style="
                <c:choose>
                    <c:when test="${o.id_chap <= Math.round(chap.size() / 2)}">grid-column: 1/2;"></c:when>
                    <c:otherwise>
                        grid-column: 2/3; grid-row: ${test};">
                        <c:set var="test" value="${test + 1}"></c:set>
                    </c:otherwise>
                </c:choose>
                Chương ${o.id_chap}: ${o.tenChuong}</div>
            </c:forEach>
        </div>
    </div>

    <div style="grid-column: 4/5; grid-row: 1/9;">
        <textarea id="0" cols="60" rows="30" hidden="hidden"></textarea> <%-- Set goc, khong xoa--%>
        <c:forEach items="${chap}" var="o">
            <div id="${o.id_chap}" hidden="hidden">
                <label>Chương ${o.id_chap}</label>
                <input id="tenChap${o.id_chap}" onchange="changnd('tenChap${o.id_chap}')" type="text" value="${o.tenChuong}">
                <textarea id="nd${o.id_chap}" onchange="changnd('nd${o.id_chap}')" cols="60" rows="30">${o.nd}</textarea>
            </div>
        </c:forEach>
    </div>

    <input style="grid-column: 2/4; height: 30px" type="submit" value="UPDATE">
</form>
<a href="admin">
    <button style="height: 30px; width: 100px">Return</button>
</a>
<script>
    let radio = document.getElementsByName("tt");
    let tt = "${info.trangthai}";
    checkbox(radio, tt);
    var el = 0;

    function showgth() {
        document.getElementById("gth").hidden = false;
        document.getElementById("gth").setAttribute("name", "gth")
    }

    function shownd(i) {
        var t1 = i;
        document.getElementById(el).hidden = true;
        el = i;
        document.getElementById(t1).hidden = false;
    }

    function changnd(x) {
        document.getElementById(x).setAttribute("name", x);
    }

</script>
</body>
</html>
