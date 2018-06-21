import java.util.*;
public class first {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String str = input.next();
        String a = "hello";
        if(lcs(str.toCharArray() , a.toCharArray() ,str.length() , a.length() ) == 5){
            System.out.println("YES");
        }
        else{System.out.println("NO");}
    }
    static int lcs( char[] A, char[] B, int m, int n )
    {
        if (m == 0 || n == 0)
            return 0;
        if (A[m-1] == B[n-1])
            return 1 + lcs(A, B, m-1, n-1);
        else
            return Math.max(lcs(A, B, m, n-1), lcs(A, B, m-1, n));
    }

}
