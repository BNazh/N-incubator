package Н;

import java.util.Scanner;
public class HWTwo{
	public static void main(String[] args){
		Scanner input=new Scanner(System.in);
		
		int a=input.nextInt();
		int b=input.nextInt();
		
		double x1=(a+Math.sqrt(a*a-4*b))/2;
		double x2=(a-Math.sqrt(a*a-4*b))/2;
		
		double y1=b/x1;
		double y2=b/x2;
		
		if(x1+y1==a & x1*y1==b){System.out.println(x1+" "+y1);}
		//if(x2+y2==a & x2*y2==b){System.out.println(x2+" "+y2);}
		else{System.out.println("JOK");}
		
		
	}
}
