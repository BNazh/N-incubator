import java.util.*;
public class task2_1{
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
                if(b<1 || b>a*a){System.out.println("Kop san or Az san");System.exit(0);}
            }
        }
        for(int iy=0;iy<a*a;iy++){
            for(int ix=0;ix<a*a;ix++){
                m.add(mas[iy][ix]);
                m1.add(mas[ix][iy]);
            }
            //System.out.println(m1);
            if(m.size()==a*a && m1.size()==a*a){m.clear();m1.clear();}
            else{System.out.println("Birdei elmentter bar");System.exit(0);}
        }
        m.clear();
        System.out.println();
        System.out.println();
        for(int it=0;it<a;it++){
            for(int ip=0;ip<a;ip++){
                for(int iq=0;iq<a;iq++){
                    for(int iu=0;iu<a;iu++){
                        //System.out.print(mas[iq+3*it][iu+3*ip]+" ");
                        m.add(mas[iq+a*it][iu+a*ip]);//
                        System.out.println(iq+a*it+" "+(iu+a*ip));
                    }

                }
                if(m.size()==a*a){m.clear();}
                else{System.out.println("kv birdeiler bar");System.exit(0);}

            }
        }
        System.out.println("success");

    }
}
