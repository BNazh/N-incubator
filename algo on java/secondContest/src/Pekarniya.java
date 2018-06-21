import java.util.*;
public class Pekarniya {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int m = input.nextInt();
        int k = input.nextInt();
        int edg[][] = new int[100001][3];
        int in[] = new int[100001];
        int min=1000000007;
        for(int i=0; i<=n;i++){
            in[i]= -1;
        }
        for(int i=0;i<m;i++){
            edg[i][0]=input.nextInt();
            edg[i][1]=input.nextInt();
            edg[i][2]=input.nextInt();
        }
        for(int i=0;i<k;i++){
            in[input.nextInt()]=0;
        }
        for(int i=0;i<m;i++)
        {
            if(edg[i][2]<min &&( (in[edg[i][0]]==0 && in[edg[i][1]]==-1) || (in[edg[i][0]]==-1 && in[edg[i][1]]==0) ))
                min=edg[i][2];
        }
        if(min==1000000007)
            System.out.println(-1);
        else
            System.out.println(min);
    }
}

