import java.util.*;
public class Djefer {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int c=0,c1=0;
        int a = input.nextInt();
        for(int i=0; i<a;i++){
            int y = input.nextInt();
            if(y==0){c++;}
            else if(y==5){c1++;}
        }
        if(c==0){System.out.println("-1");}
        else{
            if(c1<9){
                System.out.println("0");
            }
            else{

                c1 -=  c1%9;
                for(int i=0;i<c1;i++)
                    System.out.print("5");
                for(int i=0;i<c;i++)
                    System.out.print("0");
            }
        }
    }
}
