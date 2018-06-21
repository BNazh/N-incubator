import java.util.*;

public class Solution {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++)
            a[i] = sc.nextInt();

        int count = 0;

        int i = 0;
        int prev = -1;

        while (i < n) {
            int j = i + k - 1;
            if (j >= n)
                j = n-1;
            boolean found = false;
            while (j > prev) {
                if (a[j] == 1) {
                    count++;
                    prev = j;
                    i = j + k;
                    found = true;
                    break;
                }
                j--;
            }
            if (found == false) {
                count = -1;
                break;
            }
        }
        System.out.println(count);
    }
}
