import java.util.*;
public class Short {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        // your code goes here
        for (int i = 1;i < n;i ++) {
            for (int j = 1; j < n;j ++) {
                final int[][] rec = new int[n][n];
                for (int a = 0; a < rec.length; a ++) {
                    for (int b = 0;b < rec[a].length;b ++) {
                        rec[a][b] = Integer.MAX_VALUE;
                    }
                }
                search(0, 0, i, j, 0, n, rec);
                System.out.print((rec[n - 1][n - 1] != Integer.MAX_VALUE ? rec[n - 1][n - 1] : -1) + " ");
            }
            System.out.println();
        }

    }

    public static void search(int x, int y, int i, int j, int t, int n, int[][] rec) {
        if (x < 0 || y < 0 || x >= n || y >= n) {
            return;
        }

        if (Math.min(rec[x][y], t) == rec[x][y]) {
            return;
        } else {
            rec[x][y] = t;
            if (x == n - 1 && y == n - 1) {
                return;
            }
        }

        search(x + i, y + j, i, j, t + 1, n ,rec);
        search(x - i, y + j, i, j, t + 1, n ,rec);
        search(x + i, y - j, i, j, t + 1, n ,rec);
        search(x - i, y - j, i, j, t + 1, n ,rec);
        search(x + j, y + i, i, j, t + 1, n, rec);
        search(x - j, y + i, i, j, t + 1, n, rec);
        search(x + j, y - i, i, j, t + 1, n, rec);
        search(x - j, y - i, i, j, t + 1, n, rec);
    }

}