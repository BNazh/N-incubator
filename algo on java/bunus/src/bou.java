import java.util.*;
public class bou {
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        int a=input.nextInt();
        int b=input.nextInt();

        int[] arr=new int[a*a*a];

        for(int i=0;i<a;i++){
            arr[i]=input.nextInt();
            arr[i+1]=input.nextInt();
            arr[i+2]=input.nextInt();

        }
    }
}
