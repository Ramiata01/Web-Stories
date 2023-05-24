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
            grid-template-columns: 150px 250px 600px;
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
</head>
<body>
<jsp:useBean id="a" class="dao.Dao"></jsp:useBean>
<div class="head">ADD STORY</div>
<p style="color: dodgerblue">${success}</p>
<p style="color: red">${nosuccess}</p>
<form action="../../add-truyen" method="post" enctype="multipart/form-data" class="nav">
    <label class="item1">Ten Truyen: </label>
    <input class="item2" name="name" type="text" size="30">

    <label class="item1">Tac gia: </label>
    <input name="author" type="text">

    <label class="item1">Trang thai:</label>
    <div class="item2">
        <input name="tt" type="radio" value="0"> Chua hoan thanh <br>
        <input name="tt" type="radio" value="1"> Full
    </div>

    <label class="item1">The loai:</label>
    <div class="item2 it">
        <c:forEach items="${a.category}" var="o">
            <div><input name="tl${o.id}" type="checkbox"> ${o.name}</div>
        </c:forEach>
    </div>

    <label class="item1">Thêm ảnh: </label>
    <input class="item2" type="file" name="image" accept="image/png, image/jpeg, image/jpe">

    <div style="grid-column: 3/4; grid-row: 1/9;">
        <label>Phần giới thiệu:</label>
        <textarea style="grid-column: 1/3" name="gth" rows="20" cols="70"></textarea>
    </div>

    <input style="grid-column: 2/4; height: 30px" type="submit" value="ADD">
</form>
<a href="../admin">
    <button style="height: 30px; width: 100px">Return</button>
</a>
</body>
</html>
