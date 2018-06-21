import java.util.*;
public class OlegAkcii {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int akSan = input.nextInt();
        int az = input.nextInt();
        int[] mas = new int[akSan];
        int min = Integer.MAX_VALUE;

        for(int i = 0; i<akSan;i++){
            mas[i] =input.nextInt();
            if( mas[i]<min) min =mas[i] ;
        }
        long res = 0;
        for(int i:mas) {
            if(i != min) {
                res += i - min;
            }
        }
        for (int i = 0; i < akSan; i++) {
            if ((mas[i] - min) % az != 0) {
                System.out.print(-1);
                return;
            }
        }
        System.out.print(res/az);

    }
}
