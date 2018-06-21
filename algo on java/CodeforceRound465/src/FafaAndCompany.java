import java.util.*;
public class FafaAndCompany {
    static int count = 0;
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int i = input.nextInt();
        if(i%2==1 || i == 2){
            System.out.println(1);
        }
        else{
            for(int z = i;z>=2;z--){
                if(i%z==0){
                    count++;
                }
            }
            System.out.print(count);
        }


    }

}
