import java.util.*;
public class B {
    public static void main(String[] args){
        Scanner input =  new Scanner(System.in);
        int n = input.nextInt(), k = input.nextInt();
        int [] d = new int[n];
        ArrayList< ArrayList<Integer> > s = new ArrayList<>();
        for (int i = 0 ; i < n ; i++) s.add(new ArrayList<Integer>());
        for (int i = 0; i < n ; i ++) {
            d[i] = input.nextInt();
            s.get(d[i]).add(i);
        }
        long limit = 1;
        ArrayList<Edge> all = new ArrayList<>();
        for (int dist = 0 ; dist < n ; dist ++) {
            ArrayList<Integer> vs = s.get(dist);
            if (vs.size() > limit) {
                System.out.println(-1);
                return;
            }
            int edgeLimit = dist > 0 ? k-1 : k;
            limit = 1L * edgeLimit * vs.size();
            if (dist > 0) {
                int idx = 0;
                ArrayList<Integer> pr = s.get(dist - 1);
                int lm = dist = k ;
                for (int parent : pr) {
                    for (int beginIdx = idx; idx < beginIdx + lm && idx < vs.size(); idx ++) {
                        all.add(new Edge(parent, vs.get(idx)));
                    }
                }
            }
        }
        System.out.println(all.size());
        for (Edge e : all) {
            System.out.println( (e.b + 1) + " " + (e.a + 1) );
        }
    }
}
class Edge {
    int a;
    int b;
    Edge(int a, int b) {
        this.a = a; this.b = b;
    }
}
