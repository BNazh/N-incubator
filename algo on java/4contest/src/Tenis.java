import java.util.*;
public class Tenis {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int max = input.nextInt();
        int bir  = input.nextInt();
        int ekin = input.nextInt();
        if((bir < max && ekin%max != 0) || (ekin < max && bir%max != 0) ||(bir < max && ekin < max)) {
            System.out.println(-1);
        }
        else{
            System.out.print(bir/max + ekin / max);
        }
    }
}
