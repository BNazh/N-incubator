import java.util.*;
public class Naimen {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = Integer.parseInt(input.nextLine());
        String[] arr = new String[n];
        for (int i = 0; i < n; i++)
            arr[i] = input.nextLine();
        Arrays.sort(arr, (a, b) -> (a + b).compareTo(b + a));
        for (int i = 0; i < n; i++)
            System.out.print(arr[i]);
    }
}
