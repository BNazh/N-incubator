import java.util.*;
public class Subarray {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int j = 0;
        while(j < n) {
            int N = input.nextInt();
            int[] arr = new int[N];
            int mcs = Integer.MIN_VALUE;
            int ms = 0;
            int c = 0;
            int  i = 0;
            //-1 -2 -3 -1
            while(i < N) {
                arr[i] = input.nextInt();
                c += arr[i];
                if (arr[i] > 0) {
                    ms += arr[i];
                }
                if (c > mcs) {
                    mcs = c;
                }
                if (c < 0) {
                    c = 0;
                }
                i++;
            }
            if(ms == 0 && mcs < 0)
                System.out.println(mcs + " " + mcs);
            else
                System.out.println(mcs + " " + ms);
            j++;
        }
    }
}