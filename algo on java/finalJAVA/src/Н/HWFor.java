package Н;

import java.util.*;
public class HWFor{
	public static void main(String[] args){
		Scanner g=new Scanner(System.in);
		int y=g.nextInt();
		int minut;
		String q;
		int[] r=new int[y*2];
		String[] sagat;
		for(int i=0;i<y*2;i++){
			q=g.next();
			sagat=q.split(":");
			minut=Integer.parseInt(sagat[0])*60+Integer.parseInt(sagat[1]);
			r[i]=minut;
		}
		LinkedHashMap<Integer, Integer> hm = new LinkedHashMap<Integer, Integer>();
		Integer am; 
		for(int jp=0;jp<y;jp++){
			for(int it=r[jp*2];it<=r[2*jp+1];it++){
				am = hm.get(it);
				hm.put(it, am == null ? 1 : am + 1);
			}	
		}
		int max=0;
		for (Map.Entry<Integer, Integer> entrY : hm.entrySet())
			if(max<entrY.getValue()){max=entrY.getValue();}
		System.out.print(max);
	}
}
// 9:00 10:07
// 10:20 11:35
// 12:00 17:00
// 11:00 11:30
// 11:20 12:30
// 11:30 18:15