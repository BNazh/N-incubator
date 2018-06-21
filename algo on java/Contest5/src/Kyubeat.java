import java.util.*;
public class Kyubeat {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int k = 2 * input.nextInt();
        int mas[] = new int[10];
        for(int i=0;i<5;i++){
            String str =input.nextLine();
            for(int j=0;j<str.length();j++) {
                if(str.charAt(j) != '.'){
                    mas[Integer.parseInt(""+str.charAt(j)) -1]++;
                }
            }

        }
        if(mas[0] <=k && mas[1] <= k && mas[2] <= k && mas[3] <= k && mas[4] <= k && mas[5] <= k && mas[6] <= k && mas[7] <= k && mas[8] <= k) {
            System.out.println("YES");
        }
        else {
            System.out.println("NO");
        }




    }

}
