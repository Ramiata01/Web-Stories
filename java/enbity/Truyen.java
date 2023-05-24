package enbity;

public class Truyen {
    protected int id;
    private String name, introduce, author, trangthai, luotdoc, rate, img;

    public Truyen() {
    }

    public Truyen(int id, String name, String introduce, String author, String trangthai, String luotdoc, String rate, String img) {
        this.id = id;
        this.name = name;
        this.introduce = introduce;
        this.author = author;
        this.trangthai = trangthai;
        this.luotdoc = luotdoc;
        this.rate = rate;
        this.img = img;
    }

    public Truyen(int id, String name, String img) {
        this.id = id;
        this.name = name;
        this.img = img;
    }

    public Truyen(int id, String name, String img, String author) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
//        return new AsciiAndBinary().nhiphan_word(introduce);
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getLuotdoc() {
        return luotdoc;
    }

    public void setLuotdoc(String luotdoc) {
        this.luotdoc = luotdoc;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Truyen{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduce='" + introduce + '\'' +
                ", author='" + author + '\'' +
                ", trangthai='" + trangthai + '\'' +
                ", luotdoc='" + luotdoc + '\'' +
                ", rate='" + rate + '\'' +
                '}';
    }
}
