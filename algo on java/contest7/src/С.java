import java.util.Arrays;
import java.util.Scanner;

public class  С{

    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        long mod = 1000000007;
        int n = scan.nextInt();
        // \n кутылу ушын астынгы сканер
        scan.nextLine();
        String s = scan.next();
        char[] message = s.toCharArray();
        char[] mess = new char[message.length+ 1];
        for(int i = 1; i <= message.length; i++){
            mess[i] = message[i-1];
        }

        int[] a = new int[26];

        for(int i = 0; i < 26; i++){
            a[i] = scan.nextInt();
        }
        long[] p = new long[n+1];
        int[] l = new int[n+1];
        int[] m = new int[n+1];

        for(int i = 0; i <= n; i++){
            m[i] = Integer.MAX_VALUE;
        }

       m[0] = 0;
        p[0]=p[1]=l[0]=l[1]=m[1]= 1;
        for(int i = 2; i <= n; i++){
            int c = 1, back = a[mess[i] - 'a'];
            while(c <= back && i - c >= 0){
                p[i] = (p[i] + p[i-c]) % mod;
                if(i - c != 0)back = Math.min(back, a[mess[i-c] - 'a']);
                l[i] = Math.max(l[i],Math.max(c, l[i-c]));
                m[i] = Math.min(m[i], m[i-c] + 1);
                c++;
                System.out.println("p "+Arrays.toString(p));
                System.out.println("m "+Arrays.toString(m));
                System.out.println("l "+Arrays.toString(l));
            }

        }
        System.out.println(p[n]);
        System.out.println(l[n]);
        System.out.println(m[n]);
    }
}