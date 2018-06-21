import java.util.*;
public class Gromkost {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = Integer.parseInt(input.nextLine());
        String str = input.nextLine().substring(0,a);

        String[] mas = str.split(" ");
        int count = 0,max = 0;

        for(String i: mas){
            count = 0;
            if(i.length() >1) {
                for (char ia : i.toCharArray()) {
                    if (Character.isUpperCase(ia)) {
                        ++count;
                    }
                }
            }
            else{
                if(Character.isUpperCase(i.charAt(0)))
                    count++;
            }
            max = Math.max(max,count);

        }

        System.out.println(Math.max(max,count));
    }
}
