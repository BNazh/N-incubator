import java.util.Scanner;
public class B {
        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            int n = sc.nextInt();
            int a[]=new int[n];
            for(int i=0;i<n;i++)
                a[i]=sc.nextInt();
            long a1=Math.abs(a[0]-a[1]),a2=a1;
            long b1=(-1)*a1,b2=(-1)*b1;
            for(int m=-1, i = 1 ; i < a.length-1;i++){
                a1=Math.max(Math.abs(a[i]-a[i+1])*m, a1+Math.abs(a[i]-a[i+1])*m);
                b1=Math.max(Math.abs(a[i]-a[i+1])*m*(-1), b1+Math.abs(a[i]-a[i+1])*m*(-1));

                a2=Math.max(a2, a1);
                b2=Math.max(b2, b1);

                m *= -1;
            }
            System.out.println(Math.max(a2, b2));

    }
}
