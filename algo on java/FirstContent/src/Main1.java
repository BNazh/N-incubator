import java.util.*;

public class Main1 {
    public static void main(String[] args) {
        
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int n1=0,n2=0,n3=0,count=0;
        int i = 0;
        while(i<n)
        {
            int x=sc.nextInt();
            if(x==1) n1++; if(x==2) n2++; if(x==3) n3++; if(x==4) count++;
           i++;
        }
        if(n3>=n1) {count+=n3;count+=(n2+1)/2;}
        else {
            count+=n3+n2/2;
            n1-=n3;
            if(n2%2==0&&n1>0) count+=(n1-1)/4+1;
            else count+=(n1+1)/4+1;
                }
        System.out.println(count);
    }
}