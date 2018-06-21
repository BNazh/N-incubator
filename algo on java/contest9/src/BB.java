import java.util.*;
public class BB {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int n = input.nextInt();
        int[] p = new int[n+1];

        for (int i = 1; i < p.length; i++) {
            p[i] = input.nextInt();
        }

        int root = -1;

        int numchanges = 0;

        int[] seen = new int[n+1];

        for(int i =1; i <= n; i++){
            if(p[i] == i){
                root = i;
                seen[i] = n+1;
                break;
            }
        }

        for(int a = 1; a <=n; a++){
            if(seen[a] != 0) continue;
            seen[a] = a;
            int at = a;

            while(seen[p[at]] == 0){
                at = p[at];
                seen[at] = a;
            }

            if(seen[p[at]] == a){
                numchanges++;
                if(root != -1){
                    p[at] = root;
                }
                else{
                    p[at] = at;
                    root = at;
                }
            }


        }

        System.out.println(numchanges);
        for(int i =1; i <= n; i++){
            System.out.print(p[i] + " ");
        }
        System.out.println();

        input.close();
    }
}
