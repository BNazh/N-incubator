package Н;

public class HWC{
	public static void main(String[] args){
		int[] a={1,1,2,2,1,3,2,3,4,5,3,4,5};
		hw1(a);
	}
	// public static void hw1(int[] ab){
		// for(int i=0;i<ab.length;i++){
			// for(int j=i+1;j<ab.length;j++){
				// if(ab[i]==ab[j]){c++;}
			// }
		// }
		
	// }
	
	public static void hw2(int[] ab){
		int c=0;
		for(int i=0;i<ab.length;i++){
			for(int j=i+1;j<ab.length;j++){
				if(ab[i]==ab[j]){c++;}
			}
			if(c==0){System.out.print(ab[i]+" ");}
			c=0;
		}
	}
	
	public static void hw3(int[] ab){	
		for(int i=0;i<ab.length;i++){
			for(int j=i+1;j<ab.length;j++){
				if(ab[i]+ab[j]==10){System.out.print(ab[i]+" "+ab[j]+"   ");}
			}
		}
	}
}