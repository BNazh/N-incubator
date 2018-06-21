import java.util.Scanner;
import java.util.Arrays;
class MaxMin {
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        int N = input.nextInt();
        int K = input.nextInt();
        int [] A=new int[N];
        for(int i=0;i<N;i++) {
            A[i]=input.nextInt();
        }
        Arrays.sort(A);
        int min=Integer.MAX_VALUE;
        for(int i=0;i<N-K+1;i++) {
            min = Math.min(min,A[K-1+i]-A[i]);
            System.out.println(A[K-1+i]-A[i]+"  "+(K-1+i)+"  "+i);
        }
        System.out.println(min);
    }
}