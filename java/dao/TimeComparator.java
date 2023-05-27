package dao;

import enbity.Chapter;

import java.util.Comparator;

public class TimeComparator implements Comparator<Chapter> {
    @Override
    public int compare(Chapter o1, Chapter o2) {
        String t1 = o1.getTime();
        String t2 = o2.getTime();
        int c1 = ganvalue(t1);
        int c2 = ganvalue(t2);

        if (c1 == c2) {
            int cc1 = Integer.parseInt(t1.substring(0, t1.indexOf(" ")));
            int cc2 = Integer.parseInt(t2.substring(0, t2.indexOf(" ")));
            if (cc1 == cc2)
                return 0;
            else if (cc1 > cc2)
                return 1;
            else
                return -1;
        }
        else if (c1 > c2)
            return 2;
        else
            return -2;
    }

    public int ganvalue(String t) {
        String t2 = t.substring(t.indexOf(" ") + 1);

        if(t2.equals("năm")) return 5;
        if(t2.equals("tháng")) return 4;
        if(t2.equals("ngày")) return 3;
        if(t2.equals("giờ")) return 2;
        if(t2.equals("phút")) return 1;

        return 0;
    }
}
