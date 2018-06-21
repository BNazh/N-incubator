import java.util.Scanner;

public class Petia {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int f [] = new int[26];
        char c [] = input.next().toCharArray();
        for (int i = 0; i < c.length; i++) {
            f[c[i] - 97]++;
        }
        c = input.next().toCharArray();
        int q = input.nextInt();
        while (q-- > 0) {
            char d[] = input.next().toCharArray();
            int i = 0;
            int j = 0;
            int flag = 0;

            while (i < c.length && j < d.length && flag == 0) {
                if (c[i] >= 97 && c[i] <= 122) {
                    if (c[i] != d[j]) flag = 1;
                    else {
                        i++;
                        j++;
                    }
                } else if (c[i] == '?') {
                    if (f[d[j] - 97] > 0) {
                        i++;
                        j++;
                    } else {
                        flag = 1;
                    }
                } else {
                    int co = c.length - i - 1;
                    int ce = d.length - co;

                    if (d.length - j < co) {
                        flag = 1;
                    } else {
                        for (int k = j; k < ce; k++) {
                            if (f[d[k] - 97] > 0) flag = 1;
                            j++;
                        }
                    }
                    i++;
                }
            }
            if (flag == 1) {
                System.out.println("NO");
            } else {

                if ((i == c.length && j == d.length) || (j == d.length && i == c.length - 1 && c[i] == '*')) {
                    System.out.println("YES");
                } else
                    System.out.println("NO");
            }
        }
    }
}

