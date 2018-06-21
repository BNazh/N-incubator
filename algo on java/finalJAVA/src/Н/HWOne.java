package Н;

import  java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
public class HWOne{
	public static void main(String[] args){
		Scanner g=new Scanner(System.in);
		String y=g.next();
		int max=0;
		ArrayList<Integer> j=new ArrayList<Integer>();
		for(int i=0;i<y.length();i++){
			if(Integer.parseInt(y.charAt(i)+"")==0){
				max++;
			}
			else{
				j.add(max);
				max=0;
			}
			
		}
		Collections.sort(j);
		System.out.println("Max zero "+j.get(j.size()-1));
		
		
		
	}

}