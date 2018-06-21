package Н;

import java.util.*;
public class HWThree{
	public static void main(String[] args){
		Scanner input=new Scanner(System.in);
		int a=input.nextInt();
		SortedSet<Integer> m=new TreeSet<Integer>();
		SortedSet<Integer> m1=new TreeSet<Integer>();
		int[][] mas=new int[a*a][a*a];
		int b=0;
		for(int i=0;i<a*a;i++){
			for(int j=0;j<a*a;j++){
				b=input.nextInt();
				mas[i][j]=b;
				if(b<1 || b>a*a){System.out.println("Kate1");System.exit(0);}
			}
		}
		for(int iy=0;iy<a*a;iy++){
			for(int ix=0;ix<a*a;ix++){
				m.add(mas[iy][ix]);
				m1.add(mas[ix][iy]);
			}
			//System.out.println(m1);
			if(m.size()==a*a || m1.size()==a*a){m.clear();m1.clear();}	
			else{System.out.println("Kate2");System.exit(0);}
		}
		m.clear();
		 System.out.println();
		 System.out.println();
		for(int it=0;it<a;it++){
			for(int ip=0;ip<a;ip++){
				for(int iq=0;iq<a;iq++){
					for(int iu=0;iu<a;iu++){
						//System.out.print(mas[iq+3*it][iu+3*ip]+" ");
						m.add(mas[iq+a*it][iu+a*ip]);
					}
					//System.out.println();
				}
				System.out.println(m);
				if(m.size()==a*a){m.clear();}	
				else{System.out.println("Kate3");System.exit(0);}
				
			}
		}
		
	}
}

/*
3
1 8 7 4 9 2 5 6 3
5 3 4 6 7 8 9 1 2
9 6 2 1 3 5 7 8 4
4 5 8 2 1 6 3 9 7
2 7 3 8 4 9 6 5 1
6 1 9 3 5 7 4 2 8
8 4 1 9 6 3 2 7 5
7 2 6 5 8 4 1 3 9
3 9 5 7 2 1 8 4 6
/*