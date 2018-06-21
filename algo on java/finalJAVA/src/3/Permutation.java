import java.util.*;
import java.io.*;

public class Permutation{
	static ArrayList<String> list1 = new ArrayList<>();
	static ArrayList<String> list2 = new ArrayList<>();
	static HashSet<String> set;

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		String a = input.next();
		//String b = input.next();
		//int c = input.nextInt();
		permutation(a);
		//permutation(b);
		//String value="";
		//System.out.print(list1.size());

		// set = new HashSet<>();
		// for(int i = 0;i<list1.size();i++){
		// if((Integer.parseInt(list1.get(i))+Integer.parseInt(list2.get(i)))==c){
		// String value2=""+list1.get(i)+" + "+ list2.get(i)+" = "+c;
		// set.add(value2);
		// }
		// }
		// int m=1;
		// for(String val : set){
		// System.out.println(""+m+++") "+val);
		// }
	}

	//PERMUTATION
	public static void permutation(String s) {
		perm("", s);
	}

	public static void perm(String value, String s) {
		int n = s.length();
		if (n == 0) {
			System.out.println(value);
		} else {
			for (int i = 0; i < n; i++) {
				perm(value + s.charAt(i), s.substring(0, i) + s.substring(i + 1, n));
			}
		}
	}
	
	
	
	
	
	//the inventer algorithm is Al-Khwarizmi
	
	
	
	
	
	
	
}










}