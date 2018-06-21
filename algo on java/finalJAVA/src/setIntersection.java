
import java.util.*;
public class setIntersection {

    public static void main(String[] args) {
        Set<Integer> y = new HashSet<Integer>();
        y.add(1);
        y.add(2);
        y.add(4);y.add(1);y.add(20);y.add(10);

        Set<Integer> y1 = new HashSet<Integer>();
        y1.add(10);
        y1.add(30);
        y1.add(7);y1.add(1);y1.add(20);y1.add(10);

        System.out.println(y.retainAll(y1));
        System.out.println(y);

    }
}
