import java.io.*;
import java.util.*;
public class C3{

    public static void main(String args[]){
        Scanner in = new Scanner(System.in);
        int n=in.nextInt(),i=0, d;
        int[] a=new int[n];
        for(int l=0;l<n;l++) a[l]=in.nextInt();
        if(n==1)
            System.out.println(-1);
        else
        {
            Arrays.sort(a);
            if(n==2)
            {
                if(a[0]==a[1])
                {
                    System.out.println("1\n"+a[0]);
                    return ;
                }
                d=a[1]-a[0];
                if((d&1)==0)
                {
                    System.out.println(3);
                    System.out.println((a[0]-d)+" "+(a[0]+d/2)+" "+(a[1]+d));
                }
                else
                {
                    System.out.println(2);
                    System.out.println((a[0]-d)+" "+(a[1]+d));
                }
            }
            else
            {
                Map<Integer, Integer> map=new HashMap<>();
                for(i=1;i<n;i++)
                {
                    if(map.containsKey(a[i]-a[i-1]))
                        map.put(a[i]-a[i-1], map.get(a[i]-a[i-1])+1);
                    else
                        map.put(a[i]-a[i-1], 1);
                }
                if(map.size()==1)
                {
                    d=a[1]-a[0];
                    if(a[n-1]+d!=a[0]-d)
                    {
                        System.out.println(2);
                        System.out.println((a[0]-d)+" "+(a[n-1]+d));
                    }
                    else
                        System.out.println("1\n"+(a[n-1]+d));
                }
                else if(map.size()==2)
                {
                    int[] b=new int[2];
                    int[] c=new int[2];
                    i=0;
                    for(Integer e:map.keySet())
                    {
                        b[i]=e;
                        c[i]=map.get(e);
                        i++;
                    }
                    if(c[0]==1 && b[0]==2*b[1])
                    {
                        for(i=1;i<n;i++)
                        {
                            if(a[i]-a[i-1]==b[0])
                            {
                                System.out.println("1\n"+(a[i-1]+b[1]));
                                break;
                            }
                        }
                    }
                    else
                    {
                        if(c[1]==1 && b[1]==2*b[0])
                        {
                            for(i=1;i<n;i++)
                            {
                                if(a[i]-a[i-1]==b[1])
                                {
                                    System.out.println("1\n"+(a[i-1]+b[0]));
                                    break;
                                }
                            }
                        }
                        else
                            System.out.println(0);
                    }
                }
                else
                    System.out.println(0);
            }
        }
    }
}