import java.util.*;
public class Sherlock {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String soz = sc.next();
        int[] arr = new int[soz.length()];
        int f = 0,d = 0;
        for(int i = 0; i < soz.length(); i++) arr[soz.charAt(i) - 97] += 1;

        boolean firs = false;
        int z = 0;
        for(int t:arr) {
            if (!firs) {
                f = t;
                firs = true;
            }
            if (t != 0) {
                if (f != t) {
                    d++;
                    z = t;
                }
            }
        }

        if(d>1){
            System.out.println("NO");

        }
        else if(d == 1 && z != 1 && z !=10 ){
            System.out.println("NO");
        }else{
            System.out.println("YES");
        }


    }
}
