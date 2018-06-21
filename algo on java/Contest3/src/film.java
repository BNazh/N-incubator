import java.util.*;
public class film {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int size = input.nextInt();
        int el=0,jir5=0,sana=0;
        boolean bolama = true;
        for(int i=0; i<size;i++){
            sana = input.nextInt();
            if(sana == 25){
                jir5++;
            }
            else if(sana == 50 && jir5>0){
                el++;
                jir5--;
            }
            else if( (sana == 100 && ( jir5>0 && el>0)) || (sana == 100 && jir5>2) ) {
                if(el>0){
                    el -= 1;
                    jir5 -=1;
                }
                else{
                    jir5 -= 3;
                }

            }
            else{bolama = false;}
        }
        if(bolama)
            System.out.print("YES");
        else
            System.out.print("NO");
    }
}
