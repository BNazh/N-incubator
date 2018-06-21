import java.util.*;
public class LinkedListTest {
    public static void main(String[] args) {

            LinkedList list = new LinkedList();
            System.out.println("Number of items in the list: " + list.size());

            String item1 = "foo";
            String item2 = "bar";

            list.add(item1);
            list.add(item2);

            System.out.println("Number of items in the list: " + list.size());

    }
}