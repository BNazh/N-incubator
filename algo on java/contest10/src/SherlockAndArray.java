import java.util.Scanner;
public class SherlockAndArray {

    public static String method(int[] arr){
        int sum = 0;
        int j = 0;
        while(j<arr.length) {
            sum += arr[j];
            j++;
        }

        int a = 0;
        int i=0;
        while(i<arr.length){
            System.out.print(sum+ "  " + arr[i]+" "+a +":  ");
            System.out.println(sum - arr[i]-a);
            if(a == sum - arr[i]-a){
                return "YES";
            }

            a += arr[i];
            i++;
        }

        return "NO";
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();


        while(T>0){
            int n = in.nextInt();
            int[] a = new int[n];
            for(int a_i=0; a_i < n; a_i++) {
                a[a_i] = in.nextInt();
            }
            System.out.println(method(a));
            T--;
        }



    }
}
