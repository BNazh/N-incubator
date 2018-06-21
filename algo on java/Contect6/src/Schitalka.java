import java.util.*;
public class Schitalka {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int krug = input.nextInt();
        int k = input.nextInt();
        ArrayList<Integer> mas = new ArrayList<Integer>();
        for(int i =1; i<=krug; i++) {
            mas.add(i);
        }
        int z = 0;
        for (int i=0; i<k; i++){
            z = (z+input.nextInt())%krug;
            System.out.print(mas.remove(z)+" ");
            krug--;
        }
    }
}
