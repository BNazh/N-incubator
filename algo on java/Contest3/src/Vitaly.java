import java.util.*;
import static java.lang.Integer.*;

public class Vitaly {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int n = parseInt(s.nextLine());
        String in = s.nextLine();
        int key[] = new int[26];
        int count=0;
        for(int i=0;i<in.length();i++){
            int a=in.charAt(i)+32;
            if(i%2==0) {
                key[in.charAt(i) - 97]++;
            }
            else{
                if(key[(char)(a)-97]>0) {
                    key[(char)(a) -97]--;
                }
                else {
                    count++;
                }
            }
        }
        System.out.println(count);

    }

}