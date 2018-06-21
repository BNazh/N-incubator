import java.util.Iterator;
import java.util.StringJoiner;

public class JustLinkedList<T> implements Iterable<T>
{
    private Node head;
    private Node tail;
    private int size;

    private class Node
    {
        private T value;
        private Node next;
        public Node(T value)
        {
            this.value = value;
        }
    }

    public void add(T value)
    {
        Node node = new Node(value);

        if (head == null)
        {
            head = node;
        }
        else
        {
            tail.next = node;
        }

        tail = node;
        ++size;
    }

    public boolean remove(T value) {
        Node previous = null;
        Node current = head;
        while (head != null){
            if (current.value.equals(value)) {
                if (previous != null) {
                    previous.next = current.next;

                    if (current.next == null)
                    {
                        tail = previous;
                    }
                }
                else{
                    head = current.next;

                    if (head == null)
                    {
                        tail = null;
                    }
                }
                --size;
                return true;
            }
            previous = current;
            current = current.next;
        }
        return false;
    }
    public boolean contains(T value)
    {
        Node current = head;

        while (current != null)
        {
            if (current.value.equals(value))
            {
                return true;
            }

            current = current.next;
        }

        return false;
    }

    public void clear()
    {
        head = null;
        tail = null;
        size = 0;
    }

    public int size()
    {
        return size;
    }

    @Override
    public Iterator<T> iterator()
    {
        return new Iterator<T>()
        {
            private Node current = head;

            @Override
            public boolean hasNext()
            {
                return current != null;
            }

            @Override
            public T next()
            {
                Node next = current;
                current = current.next;
                return next.value;
            }
        };
    }

    @Override
    public String toString()
    {
        StringJoiner joiner = new StringJoiner(", ");

        for (T value : this)
        {
            joiner.add(value.toString());
        }

        return joiner.toString();
    }
}
