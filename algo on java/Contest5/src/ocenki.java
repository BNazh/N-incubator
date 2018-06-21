import java.util.*;
public class ocenki {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int k = input.nextInt();
        int n = input.nextInt();
        int[] a = new int[k];
        for (int i = 0; i < k; i++)
            a[i] = input.nextInt();
        int[] b = new int[n];
        for (int i = 0; i < n; i++)
            b[i] = input.nextInt();

        int[] c = new int[k];
        c[0] = a[0];
        for (int i = 1; i < k; i++)
            c[i] = c[i - 1] + a[i];


        Arrays.sort(c);
        Arrays.sort(b);

        Set<Integer> uuu = new HashSet<>();
        for (int i = 0; i <= k - n; i++) {
            int p = i, q = 0;
            int x = c[p] - b[q];
            while (p < k && q < n) {
                if (c[p] == b[q] + x) {
                    p++;
                    q++;
                } else {
                    p++;
                }
            }
            if (q == n) {
                uuu.add(x);
            }
        }
        System.out.println(uuu.size());
    }

}
