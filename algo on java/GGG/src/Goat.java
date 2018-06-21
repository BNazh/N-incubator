public class  Goat{

	public static void main(String [] ar){
		
		int [][] a = {  {0,  0,  -1, 0,  },
						{0,  0, 0, 0,  },
						{0, -1,  0, 0,  },
						{0,  0,  -1, 0,   }};
		int ways = 0;
		int dead = 0;
		int n=1;
		int m=1;
		for(int i =0;i<a[0].length;i++){
			for(int j=0;j<a.length;j++){
				if(i==0){
					if(a[0][j]==-1){
						dead+=n;
						a[0][j]=0;
						n=0;
					}
					else{
						a[0][j]=n;
					}						
					
				}
				else if(j==0){
					if(a[i][0]==-1){
						dead+=m;
						a[i][0]=0;
						m=0;
					}
					else{
						a[i][0]=m;
					}						
					}
				else{
					ways=a[i-1][j]+a[i][j-1];
					if(a[i][j]==-1){
						dead+=ways;
						a[i][j]=0;
					}
					else{
						a[i][j]=ways;
					}
				}
				
					
					
				}
			}
		
		System.out.println(dead);
		for(int i =0;i<a[0].length;i++){
			for(int j=0;j<a.length;j++){
				System.out.print(a[i][j]+"  ");
			}
			System.out.println();
		}
		
	}
}