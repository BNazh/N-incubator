import java.util.Scanner;
public class knapsack {
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        int a=input.nextInt();
        int b=input.nextInt();
        int[] mas={5,7,9,11,13};
        int[] ttt=new int[mas.length+1];

        int[][] dvmas=new int [a][b+1];

        for(int i=0;i<mas.length;i++){
            for(int j=0;j<=b;j++){
                if(i==0){
                    if(j-mas[i]>=0){dvmas[i][j]=mas[i];}
                    else{dvmas[i][j]=0;}
                }
                else if(j-mas[i]>=0){
                    dvmas[i][j]=Math.max(dvmas[i-1][j],dvmas[i-1][j-mas[i]]+mas[i]);
                }
                else{dvmas[i][j]=dvmas[i-1][j];}
            }
        }
        int max=0;
        for(int i=0;i<=b;i++) {
            System.out.print("\t"+i);
        }
        System.out.println();
        for(int i=0;i<a;i++){
            System.out.print(i+1+"\t");
            for(int j=0;j<=b;j++) {

                max=Math.max(max,dvmas[i][j]);
                System.out.print(dvmas[i][j]+"\t");
            }
            System.out.println();



        }
        System.out.println(max);
    }
}
