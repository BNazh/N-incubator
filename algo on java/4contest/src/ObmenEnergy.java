import java.util.*;
public class ObmenEnergy {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n=input.nextInt();
        int k=input.nextInt();
        int a[]=new int[n];
        for(int i=0;i<n;i++)
            a[i]=input.nextInt();
        Arrays.sort(a);

        double l = a[0];
        double r = a[n-1];
        double mid = (l+r)/2.0;


        System.out.println();
    }
}
