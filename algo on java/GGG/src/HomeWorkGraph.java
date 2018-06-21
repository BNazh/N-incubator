import java.util.*;
public class HomeWorkGraph {
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        int a = input.nextInt();
        int[][] arr =new int [a] [a];

        for(int i=0;i<a;i++){

            for(int j=0;j<a;j++){

                arr[i][j]=input.nextInt();

            }

        }

        int down=0;
        int right=0;

        for(int i=0;i<a;i++){
            down=0;
            right=0;
            for(int j=0;j<a;j++) {

                right+=arr[i][j];

                down+=arr[j][i];
            }
            System.out.print(right+down+" ");
        }



    }

}

//5
//        1 1 0 0 0
//        0 0 1 0 1
//        1 0 1 0 1
//        0 1 0 0 1
//        1 0 0 0 1