import java.util.*;
import java.io.*;

public class JustZada {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);

        int length = in.nextInt();
        int qs = in.nextInt();
        String stng = in.next();
        String temp;
        for( int i = 0; i < qs; i++){
            int s = in.nextInt() - 1;
            int e = in.nextInt();
            int k = in.nextInt();
            char[] original = stng.substring(s,e).toCharArray();
            Arrays.sort(original);
            temp = new String(original);
            if(k == 0)
                temp = new StringBuilder(temp).reverse().toString();
            stng = stng.substring(0,s) + temp + stng.substring(e);
        }
        System.out.println(stng);
    }
}