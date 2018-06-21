import java.util.*;
public class Akula {
    static int[] arr = new int[10001], mas = new int[10001];
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int san = input.nextInt();

        int a1 = 0, a2 = 0, i = 0, jauap = 0;
        while(i < san) {
            a1 = input.nextInt();
            a2 = input.nextInt();
            jauap = ttt(jauap,a1,a2);
            i++;
        }
        System.out.println(jauap);
    }
    public static int ttt(int jauap,int a,int b){
        jauap += arr[a+b];
        jauap += mas[5000 + (a - b)];
        arr[a+b]++;
        mas[5000 + (a - b)]++;
        return jauap;
    }
}
