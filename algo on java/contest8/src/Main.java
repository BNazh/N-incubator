import java.util.Scanner;

public class Main {
    static int n, k;
    static String str;

    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        n = sc.nextInt(); k = sc.nextInt();
        sc.nextLine();
        str = sc.nextLine();

        int ans = 1;
        int s = 0, t = 0, count = 0;
        // 'a'
        while(t < n){
            if(str.charAt(t) == 'b'){
                ++count;
            }
            if(count > k){
                ans = Math.max(ans, t - s);
                while(s <= t && str.charAt(s) == 'a'){
                    ++s;
                }
                ++s;
                --count;
            }
            ++t;
        }
        ans = Math.max(ans, t - s);

        // 'a'
        s = t = count = 0;
        while(t < n){
            if(str.charAt(t) == 'a'){
                ++count;
            }
            if(count > k){
                ans = Math.max(ans, t - s);
                while(s <= t && str.charAt(s) == 'b'){
                    ++s;
                }
                ++s;
                --count;
            }
            ++t;
        }
        ans = Math.max(ans, t - s);

        System.out.println(ans);
    }
}