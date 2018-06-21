import java.lang.reflect.Array;
import java.util.*;
public class test {
    public static void main(String[] args) {
        JustLinkedList<String> a = new JustLinkedList<String>();
        a.add("a");
        a.add("a");
        a.add("ab");
        a.add("abc");
        a.add("abcd");
        a.add("a");
        a.remove("a");

        System.out.print(a.toString());

    }
}
