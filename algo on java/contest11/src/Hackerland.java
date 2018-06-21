import java.util.*;
public class Hackerland {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int k = in.nextInt();
        int[] x = new int[n];
        for(int x_i=0; x_i < n; x_i++){
            x[x_i] = in.nextInt();
        }
        Arrays.sort(x);
        int i=0;
        int count=0;
        while(i<n){
            int max_pos = x[i]+k;
            while (i<n && x[i]<=max_pos)
                i++;
            int pos = x[i-1];
            count++;
            while (i<n && x[i]<=pos+k)
                i++;
        }
        System.out.println(count);
    }
}
