package dao;

public class Thembr {

    public String nhiphan_word(String chuoi) {
        String kq = "";
        int tong = 0, mu = 0, a;
        for (int i = 0; i < chuoi.length(); i++) {
            a = (int) chuoi.charAt(i);

            if (a == 13) {
                kq += "<br>";
            } else {
                kq += chuoi.charAt(i);
            }

        }
        return kq;
    }
}
