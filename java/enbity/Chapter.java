package enbity;

public class Chapter {
    private String id_chap, tenChuong, nd;

    public Chapter() {
    }

    public Chapter(String id_chap, String tenChuong, String nd) {
        this.id_chap = id_chap;
        this.tenChuong = tenChuong;
        this.nd = nd;
    }

    public String getId_chap() {
        return id_chap;
    }

    public void setId_chap(String id_chap) {
        this.id_chap = id_chap;
    }

    public String getTenChuong() {
        return tenChuong;
    }

    public void setTenChuong(String tenChuong) {
        this.tenChuong = tenChuong;
    }

    public String getNd() {
        return nd;
    }

    public void setNd(String nd) {
        this.nd = nd;
    }
}
