import java.util.*;
import java.io.*;
class Kruskal {
	public static void main(String[] args) throws Exception{
		File file = new File("edgelist.txt");
		Scanner scn = new Scanner(file);
		int a = scn.nextInt();
		HashMap<String,Integer> edgever = new HashMap<>();
		ArrayList<String> ver = new ArrayList<>();
		for (int i = 0; i < a; i++) {
			edgever.put(""+scn.nextInt()+scn.nextInt(),scn.nextInt());
		}
		ArrayList<Map.Entry<String,Integer>> list=new ArrayList<>(edgever.entrySet());
		Collections.sort(list, (o1,o2)->{
			return o1.getValue().compareTo(o2.getValue());
		});
		String res1 = ""+list.get(0).getKey().split("")[0], res2 = ""+list.get(0).getKey().split("")[1];
		int count = 0;
		for (Map.Entry<String,Integer> i: list) {
			//System.out.println(res1+"||"+res2+" key: "+i.getKey()+"   "+(!(res1.contains(""+i.getKey().split("")[0]) && res1.contains(""+i.getKey().split("")[1]))));
			if(!(res1.contains(""+i.getKey().split("")[0]) && res1.contains(""+i.getKey().split("")[1])) && !(res2.contains(""+i.getKey().split("")[0]) && res2.contains(""+i.getKey().split("")[1]))){
				//System.out.println("qwe "+res1+"||"+res2+" key: "+i.getKey()+"   "+(!(res1.contains(""+i.getKey().split("")[0]) && res1.contains(""+i.getKey().split("")[1]))));
				ver.add(""+i); res1 += i.getKey().split("")[0]; res2 += i.getKey().split("")[1];
				count += i.getValue();
			}
		}
		System.out.println(ver+" "+count);
	}
}