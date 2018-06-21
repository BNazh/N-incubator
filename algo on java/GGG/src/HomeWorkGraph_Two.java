public class HomeWorkGraph_Two {
    static int [][]a={{0,2,0,0,7},
                     {2,0,1,0,3},
                     {0,1,0,0,2},
                     {0,0,0,0,2},
                     {7,3,2,2,3}};

    public static void main(String []args){
        fun(0,0,"");

    }
    static void fun(int count,int n,String path){
        for(int i=n+1;i<a.length;i++){
            if(a[n][i]!=0){
                fun(count+a[n][i],i,path+(n+1));

            }

        }
        if(n==a.length-1){

            System.out.print(path+5+" "+count+"    ");
        }
    }
}

