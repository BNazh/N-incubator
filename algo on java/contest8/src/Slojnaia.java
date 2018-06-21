import java.util.*;
public class Slojnaia {
    static long INF = (long) 1e14 + 1;
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int n = Integer.parseInt(input.nextLine());
        int[] san = new int[n];
        for (int i = 0; i < n; i++)
            san[i] = input.nextInt();
        input.nextLine();
        String[] ss = new String[n];
        for (int i = 0; i < n; i++)
            ss[i] = input.nextLine();
        long[] z0 = new long[n];
        long[] z1 = new long[n];
        z0[0] = 0;
        z1[0] = san[0];
        for (int i = 1; i < n; i++) {
            String[] st = {"","","",""};
            System.out.println();
            st[0] = ss[i - 1]; st[1] = new StringBuilder(ss[i - 1]).reverse().toString();
            st[2]= ss[i];    st[3] = new StringBuilder(ss[i]).reverse().toString();
            z0[i] = z1[i] = INF;
            if (st[0].compareTo(st[2]) <= 0)
                z0[i] = Math.min(z0[i], z0[i - 1]);
            if (st[1].compareTo(st[2]) <= 0)
                z0[i] = Math.min(z0[i], z1[i - 1]);
            if (st[0].compareTo(st[3]) <= 0)
                z1[i] = Math.min(z1[i], z0[i - 1] + san[i]);
            if (st[1].compareTo(st[3]) <= 0)
                z1[i] = Math.min(z1[i], z1[i - 1] + san[i]);
        }
        long m = Math.min(z0[n - 1], z1[n - 1]);
        System.out.println(m >= INF ? -1 : m);
    }

}
