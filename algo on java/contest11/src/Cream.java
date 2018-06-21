import java.util.Scanner;
public class Cream {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int number = input.nextInt();
        for (int i = 0; i < number; i++) {
            int ten = input.nextInt(),pp = input.nextInt();
            int[] set = new int[pp];
            for (int j = 0; j < pp; j++) set[j] = input.nextInt();
            for (int j = 0; j < pp; j++) {
                for (int j2 = j+1; j2 < set.length; j2++) {
                    if(set[j]+set[j2]==ten){
                        System.out.print((j+1)+" "+(j2+1)+"\n");
                    }
                }
            }
        }
    }
}


