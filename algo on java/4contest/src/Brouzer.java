import java.util.*;
public class Brouzer {
    public static void main(String[] args){
        Scanner in=new Scanner(System.in);
        int n=in.nextInt();
        int m=in.nextInt();
        int l=in.nextInt();
        int r=in.nextInt();
        if (l==1 && r==n){
            System.out.print(0);
        }
        else if (l==1){
            System.out.print(Math.abs(m-r)+1);
        }
        else if (r==n){
            System.out.print(Math.abs(m-l)+1);
        }
        else{
            if (Math.abs(m-l)>Math.abs(m-r)){
                System.out.print(Math.abs(m-r)+1+(r-l)+1);
            }
            else{
                System.out.print(Math.abs(m-l)+1+(r-l)+1);
            }
        }
    }
}
