import java.util.*;
public class B2 {
    public static void main(String[] args) {
        Scanner sc =new Scanner(System.in);
        int a=sc.nextInt();
        if(a==1){
            System.out.println("-1");System.exit(0);
        }
        if(a==2){
            double ll=sc.nextInt(),lh=sc.nextInt();
            double s=(double)((lh+ll)/2);
            if(s == (int)(s)){
                if(lh!=ll){
                    System.out.println(3);
                    System.out.print((int)(Math.min(2*ll - lh,(2*lh - ll) )) + " " + (int)(((lh+ll)/2)) + " " + (int)(Math.max(2*ll - lh,(2*lh - ll) )));
                    System.exit(0);
                }
                else {System.out.println("1");System.out.println((int)(lh));
                System.exit(0);}
            }
            else{
                System.out.println(2);
                System.out.print((int)(Math.min(2*ll - lh,(2*lh - ll)) ) + " " + (int)(Math.max(2*ll - lh,(2*lh - ll) )));
                System.exit(0);
            }
        }

        int[] mas = new int[a];
        int i=0;
        while(i<a){
            mas[i]=sc.nextInt();
            i++;}
        Arrays.sort(mas);
        boolean bol=false;
        double o=0;
        int z=1;
        int k=Math.min(mas[1]-mas[0], mas[2]-mas[1]);

        while(z<a){
            if(mas[z]-mas[z-1]!=k){
                if(mas[z]-mas[z-1]==2*k && !bol){
                    bol=true;
                    o=(mas[z]+mas[z-1])/2;}
                else{
                    System.out.println(0);System.exit(0);}
            }
            z++;
        }
        if(bol && k!=0) {
            if(o==(int)o){
                System.out.println("1");System.out.println((int)o);System.exit(0);}
            else {System.out.println("0");
            }
        }
        if(k==0){System.out.println(1);System.out.println(mas[0]);System.exit(0);}
        System.out.println("2");
        System.out.println((2*mas[0]-mas[1]) + " " + (2*mas[a-1]-mas[a-2]));
    }
}