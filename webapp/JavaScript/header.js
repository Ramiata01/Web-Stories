function colortd() {
    let sl = document.querySelectorAll(".tieude");
    for (let i = 0; i < sl.length; i++) {
        sl[i].style.color = "rgb(255, 255, 255)";
    }
}

function gachchan(x) {
    x.style.textDecoration = "underline";
}
function khonggachchan(x) {
    x.style.textDecoration = "none"
}