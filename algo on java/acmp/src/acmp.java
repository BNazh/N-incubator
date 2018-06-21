import java.util.*;
public class acmp {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String a = input.next();
        String[] massiv = a.split("-");
        try {
            if (massiv.length == 1) {
                System.out.println("ERROR");
            } else {
                int a1 = ((int) massiv[0].charAt(0)) - 64;
                int a2 = Integer.parseInt("" + massiv[0].charAt(1));
                int a3 = ((int) massiv[1].charAt(0)) - 64;
                int a4 = Integer.parseInt("" + massiv[1].charAt(1));
                double tt = Math.sqrt((Math.abs(a1 - a3) + 1) * (Math.abs(a1 - a3) + 1) + (Math.abs(a2 - a4) + 1) * (Math.abs(a2 - a4) + 1));
                if (tt == Math.sqrt(13) && a1<9 && a3<9 && a1>0 && a3>0  ) {
                    System.out.println("YES");
                } else if (tt != Math.sqrt(13) && a1<9 && a3<9 && a1>0 && a3>0 ) {
                    System.out.print("NO");
                } else {
                    System.out.println("ERROR");
                }
            }
        }catch (Exception e){System.out.println("ERROR");}
    }
}
