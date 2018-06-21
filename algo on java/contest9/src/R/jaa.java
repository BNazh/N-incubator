import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Scanner;

public class jaa {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n =  scanner.nextInt();
        long[] array = new long[n];
        for (int i = 0; i < n; i++) {
            array[i] =  scanner.nextInt();
        }
        if (n == 1) {
            System.out.print(-1);
            return;
        }
        if (n == 2) {
            Arrays.sort(array);
            if (array[0] == array[1]) {
                System.out.println(1);
                System.out.print(array[0]);
                return;
            }
            long d = array[1] - array[0];
            if (d % 2 == 0) {
                System.out.println(3);
                System.out.print((array[0] - d) + " " + (array[0] + d/2) + " " + (array[1] + d));
            }
            else {
                System.out.println(2);
                System.out.print((array[0] - d) + " " + (array[1] + d));
            }
            return;
        }
        Arrays.sort(array);
        long[] array1 = new long[n-1];
        for (int i = 1; i < n; i++) {
            array1[i-1] = array[i] - array[i-1];
        }
        int mark = 0;
        for (int i = 1; i < array1.length; i++) {
            if (array1[i] != array1[i-1])
                mark++;
        }
        if (mark == 0) {
            if (array[0] - array1[0] == array[n-1] + array1[0]) {
                System.out.println(1);
                System.out.print(array[0] - array1[0]);
                return;
            }
            System.out.println(2);
            System.out.print(array[0]-array1[0]);
            System.out.print(" ");
            System.out.print(array[n-1] + array1[0]);
        }
        else {
            long[] array2 = new long[n-1];
            for (int i = 0; i < n - 1; i++) {
                array2[i] = array1[i];
            }
            Arrays.sort(array2);
            if (array2[0] == array2[n-3] && array2[n-2] % 2 == 0 && array2[0] == array2[n-2]/2) {
                int ind = 0;
                for (int i = 0; i < n - 1; i++) {
                    if (array1[i] == array2[n-2]) {
                        ind = i;
                        break;
                    }
                }
                System.out.println(1);
                System.out.print((array[ind] + array[ind+1])/2);
            }
            else {
                System.out.print(0);
            }
        }
    }
}
