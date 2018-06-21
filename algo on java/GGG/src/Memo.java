public class Memo{
	static int[] l;
	public static void main(String[] args){
		 MemCon(60);
		//m(10);
		//System.out.println(MonPr(60));
		System.out.println( MonPr(4));
		
		//System.out.println(MonPro(10));
		
	
	
	}
	
	public static void m(int a){
		l=new int[a+1];
	}
	
	public static void MemCon(int a){
		l=new int[a+1];
		l[0]=MonPr(0);
		l[1]=MonPr(1);
		l[2]=MonPr(2);
		l[3]=MonPr(3);
		l[4]=MonPr(4);
	}
	
	// public static int fibMem(int n){
		// if (l[n] == 0)
		// {
			// if (n <= 1)
				// l[n] = n;
			// else
				// l[n] = fibMem(n-1) + fibMem(n-2);
		// }
		// return l[n];
		
	// }
	
	
	
	// public static int TabFib(int n){
		// int [] t=new int[n+1];
		// t[0]=0;
		// t[1]=1;
		
		// for(int i=2;i<=n;i++){
			// t[i]=t[i-1]+t[i-2];
		// }
		// return t[n];
		
		
	// }
	// public static int fib(int i){
		// if(i==0){
			// return 0;
					
		// }
		// if(i==1){
			// return 1;
			
		// }
		// return fib(i-1)+fib(i-2);
	// }

public static int MonProMem(int n){
		if(n<0){return 0;}
		else if(l[n]==0){
				l[n]=MonProMem(n-2)+MonProMem(n-3)+MonProMem(n-5);
		}
		return l[n];
	}
	public static int MonPrT(int n){
		int	[] m = new int[n+1];
		m[0]=MonPr(0);
		m[1]=MonPr(1);
		m[2]=MonPr(2);
		m[3]=MonPr(3);
		m[4]=MonPr(4);
		for(int i=5;i<=n;i++){
			m[i]=m[i-2]+m[i-3]+m[i-5];
		}
		return m[n];
	}
	public static int MonPr(int n){
		
		if (n<0){
			return 0;
			
		}
		if(n==0){
			return 1;
		}
		return MonPr(n-2)+MonPr(n-3)+MonPr(n-5);
		
	}
}