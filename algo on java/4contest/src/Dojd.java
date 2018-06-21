import java.util.*;
public class Dojd {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = input.nextInt();
        int[] arr = new int[a];
        boolean b = true;
        for (int i = 0; i < a; i++)
            arr[i] = input.nextInt();
        int kanshaSht = 0;
        int bir = 0;
        for (int i = 0; i < a; i++) {
            b = true;
            bir = 0;
            for (int j = i; j > 0; j--)
                if (arr[j] >= arr[j - 1] && b)
                    bir++;
                else
                    b = false;
            b = true;
            for (int j = i; j < a - 1; j++) {
                if (arr[j] >= arr[j + 1] && b)
                    bir++;
                else
                    b = false;
            }
            if (bir > kanshaSht) {
                kanshaSht = bir;
            }
        }
        System.out.println(kanshaSht + 1);
    }

}
