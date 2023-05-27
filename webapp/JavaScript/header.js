function colortd(td, colorlink, mauchu) {
    let link = document.querySelectorAll("a");
    let sl = document.querySelectorAll(".tieude");
    let kvtr = document.querySelector(".kv_truyen");
    let tr = document.querySelectorAll(".white");
    if(sl != null) {
        for (let i = 0; i < sl.length; i++) {
            sl[i].style.color = td;
        }
    }
    if(link != null) {
        for (let i = 0; i < link.length; i++) {
            link[i].style.color = colorlink;
        }
    }
    if(kvtr != null) {
        kvtr.style.color = mauchu;
    }
    if(tr != null) {
        for (let i = 0; i < tr.length; i++) {
            tr[i].style.color = "white";
            console.log(tr[i].innerHTML)
        }
    }
}

function changcolorall(x) {
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
        colortd("var(--colortdtoi)", "var(--colortoi)", "var(--colortoi)");
        x.options[1].selected = true;
        return "black";
    }else {
        document.querySelector("body").style.backgroundColor = "var(--background-color)";
        document.querySelector("body").style.color = "var(--color)";
        document.querySelector(".header .top").style.backgroundColor = "var(--background-color-header)";
        document.querySelector(".header .bottom").style.backgroundColor = "var(--background-color-headerbottom)";
        document.querySelector(".header .bottom").style.backgroundColor = "var(--background-color-headerbottom)";
        colortd("var(--color)", "var(--color)", "black");
        x.options[0].selected = true;
        return "noblack";
    }
}

function bottom_link(link) {
    let ndhead = '<a onmouseover="gachchan(this)" onmouseout="khonggachchan(this)" style="text-decoration: none;" href="index.jsp">Truyện </a>/ ';
    document.getElementById("header_bottom").innerHTML = ndhead + link;
}

function gachchan(x) {
    x.style.textDecoration = "underline";
}
function khonggachchan(x) {
    x.style.textDecoration = "none"
}