import java.util.Scanner;

public class DYL {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int p = input.nextInt();
        int n = input.nextInt();

        int[] arr = new int[400];
        int a = 0;
        int index = -1;
        boolean isTrue = true;
        for(int i = 1; i <= n; i++){
            a = input.nextInt();
            if((arr[a % p])==1){
                index = i;
                break;
            }
            else{arr[a%p] = 1;}
        }


        System.out.print(index);

    }

}
