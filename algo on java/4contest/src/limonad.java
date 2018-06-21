import java.util.*;
public class limonad {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int total = input.nextInt();
        long[] stoimost = new long[n];
        long[] costs = new long[31];
        for (int i = 0; i < n; i++)
            stoimost[i] = input.nextLong();
        costs[0] = stoimost[0];

        for (int j = 1; j < 31; j++) {
            if (j < n) {
                costs[j] = Math.min(2 * costs[j-1], stoimost[j]);
            }
            else {
                costs[j] = 2 * costs[j-1];
            }
        }
        long a = 0L;
        for (int i = 0; i < 31; i++) {
            if (total % 2 == 1) {
                a += costs[i];
            } else {
                if (costs[i] < a) {
                    a = costs[i];
                }
            }
            total = total / 2;
        }
        System.out.println(a);
    }
}
