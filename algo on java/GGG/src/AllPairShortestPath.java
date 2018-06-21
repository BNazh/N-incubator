import java.util.*;
import java.lang.*;
import java.io.*;

//BY BEST NOLAN
public class AllPairShortestPath {
    final static int INF = 9999999;
    static int V;
    static void floydWarshall(int graph[][]) {
        for (int k = 0; k < V; k++) {
            for (int i = 0; i < V; i++) {
                for (int j = 0; j < V; j++) {
                    if (graph[i][k] + graph[k][j] < graph[i][j])
                        graph[i][j] = graph[i][k] + graph[k][j];
                }
            }
        }
        for (int i=0; i<V; ++i) {
            for (int j=0; j<V; ++j) {
                if (graph[i][j]==INF)
                    System.out.print("INF"+"\t");
                else
                    System.out.print(graph[i][j]+"\t");
            }
            System.out.println();
        }
    }
    public static void main (String[] args)
    {
        Scanner input=new Scanner(System.in);
        V=input.nextInt();
        int graph[][] = new int[V][V];
        for(int i=0;i<V;i++){
            for(int j=0 ;j<V;j++){
                graph[i][j]=input.nextInt();
                if( graph[i][j]==0 && i!=j){
                    graph[i][j]=INF;
                }
            }
        }
        floydWarshall(graph);
    }
}

