import java.util.*;
public class second {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int asd = input.nextInt();
        long h = 0;
        int tt=0 ;
        while(tt<asd){
            h += 1+(asd-tt)*tt;
            tt++;
        }
        System.out.println(h);

    }


}
