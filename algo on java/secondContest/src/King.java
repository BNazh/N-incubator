import java.util.*;
public class King {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String st = input.next();
        int a = st.charAt(0)-97;
        int a1 = Integer.parseInt(""+st.charAt(1));
        if(a1==1 && a != 0 && a != 7  || a1 == 8 && a != 0 && a != 7  || a == 0 && a1 != 1 && a1 != 8 || a == 7 && a1 != 1 && a1 != 8 ){
            System.out.print(5);
        }
        else if(a1>1 && a1<8){
            System.out.print(8);
        }
        else{
            System.out.print(3);
        }


    }
}
