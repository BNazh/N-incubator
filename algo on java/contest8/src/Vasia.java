import java.util.*;
public class Vasia {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt(), m = input.nextInt();
        String s = input.next();
        int z = 0, mps = 0;
        int[]  abcount = new int[2];
        for(int r = 0 ; r < n;r++) {
            abcount[s.charAt(r) - 97]++;
            if (Math.min(abcount[0], abcount[1]) > m) {
                abcount[s.charAt(z) - 97]--;
                z++;
                //System.out.println( abcount[0] + " "+abcount[1]+" "+z);
            } else {
                mps++;
            }
        }
        System.out.println(mps);
    }
}
