import java.util.Scanner;

public class Cirvak {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int s = 0;
        int[] a = new int[1000001];
        for (int i = 0, j = 1; i < n; i++) {
            s += input.nextInt();
            while (j <= s) {
                a[j] = i + 1;
                j++;
            }
        }
        int m = input.nextInt();
        for (int i = 0; i < m; i++)
            System.out.println(a[input.nextInt()]);
    }
}