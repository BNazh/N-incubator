import java.util.*;
public class TrieST<Value>{
	private static final int R = 26;
	private Node root = new Node();

	private static class Node{
		private Object val;
		private Node[] next = new Node[R];
	}

	public void put(String key,Value val){
		root = put(root,key,val,0);
	}

	private Node put(Node x, String key, Value val, int d){
		if(x == null) x = new Node();
		if(d == key.length()) { x.val = val; return x; }
		char c = key.charAt(d);
		x.next[c-'a'] = put(x.next[c-'a'], key, val, d+1);
		return x;
	}

	public boolean contains(String key){
		return get(key) != null;
	}

	public Value get(String key){
		Node x = get(root, key, 0);
		if(x == null) return null;
		return (Value) x.val;
	}

	private Node get(Node x, String key, int d){
		if(x == null) return null;
		if(d == key.length()) return x;
		char c = key.charAt(d);
		return get(x.next[c-'a'], key, d+1);
	}

	public ArrayList<String> keysWithPrefix(String prefix) {
        ArrayList<String> results = new ArrayList<String>();
        Node x = get(root, prefix, 0);
        collect(x, new StringBuilder(prefix), results);
        return results;
    }

    private void collect(Node x, StringBuilder prefix, ArrayList<String> results) {
        if (x == null) return;
        if (x.val != null) results.add(capitalize(prefix.toString()));
        for (char c = 97; c < TrieST.R+97; c++) {
            prefix.append(c);
            collect(x.next[c-'a'], prefix, results);
            prefix.deleteCharAt(prefix.length() - 1);
        }
    }
    private String capitalize(final String line) {
   		return Character.toUpperCase(line.charAt(0)) + line.substring(1);
	}
}