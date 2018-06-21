import java.util.*;
public class MakhmudM {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int n = scan.nextInt(), resalt = 0; scan.nextLine();
        String s = scan.nextLine();
        int[] mass = new int[26];
        for(int i = 0 ; i <= 25 ; i++) mass[i] = scan.nextInt();

        int MOD = (int)1e9+7;
        int[][] arr = new int[n+1][2];
        arr[0][0] = 1;
        int max = 0,i = 1;
        while(i <= n){
            max = 0;
            arr[i][1] = n;
            for(int j = i-1 ; j >= 0 ; j--){
                max = Math.max(max, i-mass[s.charAt(j)-'a']);
                if(max > j) continue;

                arr[i][1] = Math.min(arr[i][1], arr[j][1] + 1);

                arr[i][0] = (arr[i][0] + arr[j][0])%MOD;

                resalt = Math.max(resalt, i-j);
            }
            i++;
        }
        System.out.println(arr[n][0]);
        System.out.println(resalt);
        System.out.println(arr[n][1]);
    }
}
