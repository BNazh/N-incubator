import java.util.*;
public class aORb {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int m =input.nextInt();
        int z = 1;
        String result = "" + m;
        while (true)
        {
            if (m < n) {
                result = "NO";
                break;
            }
            else if (m == n) {
                result = "YES\n" + z + "\n" + result;
                break;
            }
            else if (m % 2 == 0) {
                m /= 2;
                result = m + " " + result;
                z++;
                continue;
            }
            else if ((m - 1) % 10 == 0)
            {
                m = (m - 1) / 10;
                result = m + " " + result;
                z++;
                continue;
            }
            else {
                result = "NO";
                break;
            }
        }

        System.out.print(result);
    }
}
