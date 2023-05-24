<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 5/22/2023
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
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
            cursor: default;
            margin-bottom: 10px;
        }

        .var {
            display: grid;
            grid-template-columns: 500px 500px 500px;
        }
    </style>
</head>
<body>
<jsp:useBean id="ndchap" class="dao.Dao"></jsp:useBean>
<% int id = Integer.parseInt(request.getParameter("id"));  %>
<% int setchap = ndchap.getChapterByIdTruyen(id).size(); %>

<div class="head">INSERT CHAPTER</div>
<form action="../../page?id=<%=id%>" method="post" enctype="multipart/form-data">
    <div id="addchuong" class="var">
    </div>

    <input type="button" value="Click để thêm" onclick="addchap()">
    <input type="button" id="submit" value="COMPLETE" onclick="checksubmit()">
    <div id="warn" style="color: red"></div>
</form>

<script>
    let tt = id = Number(<%= setchap %>);
    let stop = 0;
    let name = [], noidung = [];

    function addchap() {
        let add = document.getElementById("addchuong");
        let sl = 0;

        if(stop < 6) {
            if(stop != 0) {         //lay gia tri tu chap truoc
                let j = document.getElementsByTagName("input");
                let k = document.getElementsByTagName("textarea")
                name.push(j[j.length - 3].value);
                noidung.push(k[k.length - 1].value);
            }
            tt += 1;
            document.getElementById("addchuong").innerHTML = add.innerHTML +
                '<div><label name="so' + tt + '">Chương ' + tt + '</label>: <input type="text" id="na' + tt + '" name="na' + tt + '" size="40" placeholder="nhap ten truyen"> <br><br>' +
                '<textarea id="nd' + tt + '" name="nd' + tt + '" placeholder="nhap noi dung" rows="30" cols="60"></textarea></div>';
            if(stop != 0) {
                for (let i = id + 1 ; i < tt; i++) {
                    document.getElementById("na" + i).value = name[sl];
                    document.getElementById("nd" + i).value = noidung[sl];
                    sl ++
                }
            }
            stop += 1;
        }
    }

    function checksubmit() {
        let j = 1;
        let test = false;
        for (let i = Number(<%= setchap %>) + 1; i <= Number(<%= setchap %>) + 5; i++) {
            let nd = "nd" + i;
            let na = "na" + i;
            let getnd = document.getElementById(nd);
            if(getnd !== null) {
                let getna = document.getElementById(na);
                if((getna.value != "" && getnd.value != "")) {
                    test = true;
                } else if (getna.value == "" && getnd.value == "" && j != 1) {
                    getna.removeAttribute("name");
                    getnd.removeAttribute("name");
                }
                else {
                    test = false;
                }
            }
            j++;
        }
        if(test) {
            document.getElementById("submit").setAttribute("type", "submit");
        } else {
            alert("Điền đầy đủ thông tin");
        }
    }



</script>
</body>
</html>
