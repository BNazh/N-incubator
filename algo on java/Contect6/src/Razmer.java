import java.util.*;
public class Razmer {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int h = input.nextInt();
        double h1 = (double)h/(Math.sqrt(n));
        int i = 1;
        while(i<n){
            System.out.print(h1*(Math.sqrt(i))+" ");
            i++;
        }
    }
}