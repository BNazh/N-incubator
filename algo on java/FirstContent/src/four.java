import java.util.*;
public class four {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = input.nextInt();
        int b = input.nextInt();
        int [] arr =new int[a*b ];
        for(int i=0; i<a*b;i++){
                arr[i]=input.nextInt();
        }

        int [][] arr1 = new int[a*a][b*b];
        for(int i=0;i<a;i++){
            for(int j=0;j<b;j++){
                if(i==0)
                    arr1[i][j]=arr[i];
                else{
                    arr1[i][j]= arr1[i-1][j]+arr[j-1];
                }
            }
        }
        System.out.println(arr1[a][b]);
    }

}
