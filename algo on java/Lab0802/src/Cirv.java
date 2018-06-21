import java.util.Scanner;
public class Cirv {
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int j = 0;
        int sum = 0;
        int [] a = new int[1000005];
        for (int i = 1; i <= n; i++)
        {
            sum += input.nextInt();
            while (j <= sum)
            {
                a[j++] = i;
            }
        }
        int m = input.nextInt();
        int p = 0;
        for (int i = 0; i < m; i++) {
            p = input.nextInt();
            System.out.println(a[p]);
        }
    }
}