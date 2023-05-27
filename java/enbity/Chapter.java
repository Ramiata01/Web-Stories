package enbity;

public class Chapter extends Truyen {
    private String id_chap, tenChuong, nd, time;

    public Chapter() {
    }

    public Chapter(int id, String name, String img, String id_chap, String time) {
        super(id, name, img);
        this.id_chap = id_chap;
        this.time = time;
    }

    public Chapter(int id, String name, String img, String author, String id_chap, String time) {
        super(id, name, img, author);
        this.id_chap = id_chap;
        this.time = time;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
