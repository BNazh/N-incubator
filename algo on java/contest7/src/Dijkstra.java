//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.Scanner;
//public class Dijkstra{
//	static List<Integer>[] G;
//	static List<Integer>[] W;
//	static Road.Pair<Integer, Road.Edge>[] E;
//	public static void main(String[] args) {
//		Scanner input = new Scanner(System.in);
//		buildGraph(input, input.nextInt(), input.nextInt());
//
//		to(G);
//
//
//	}
//	static List<Road.Pair<Integer, Road.Edge>> kruskalMst() {
//		Arrays.sort(E, (p1, p2) -> p1.getKey() - p2.getKey());
//		DisjointSet ds = new DisjointSet(100_000);
//		List<Road.Pair<Integer, Road.Edge>> mst = new ArrayList<>(G.length);
//		for (Road.Pair<Integer, Road.Edge> p: E) {
//			Road.Edge e = p.getValue();
//			if (!ds.connect(e.getValue(), e.getKey()))
//				continue;
//			mst.add(p);
//		}
//		return mst;
//	}
//	static void buildGraph(Scanner scanner, int maxNumOfNodes, int maxNumOfEdges) {
//		G = new List[maxNumOfNodes];
//		W = new List[maxNumOfNodes];
//		E = new Road.Pair[maxNumOfEdges];
//		int capacity = 100;
//		for (int i = 0; i < G.length; i++) {
//			G[i] = new ArrayList<>(capacity);
//			W[i] = new ArrayList<>(capacity);
//		}
//		for (int i = 0; i < maxNumOfEdges; i++) {
//			int v = scanner.nextInt() - 1;
//			int u = scanner.nextInt() - 1;
//			int w = scanner.nextInt();
//			G[v].add(u);
//			G[u].add(v);
//			W[v].add(w);
//			W[u].add(w);
//			E[i] = new Road.Pair<>(w, new Road.Edge(v, u));
//		}
//	}
//
//	static void buildGraph(List<Road.Pair<Integer, Road.Edge>> edges, int maxNumOfNodes) {
//		for (int i = 0; i < G.length; i++) {
//			G[i].clear();
//			W[i].clear();
//		}
//		for (Road.Pair<Integer, Road.Edge> p: edges) {
//			int w = p.getKey();
//			int v = p.getValue().getKey();
//			int u = p.getValue().getValue();
//			G[v].add(u);
//			G[u].add(v);
//			W[v].add(w);
//			W[u].add(w);
//		}
//	}
//	public static void to(List<Integer>[] a){
//		for(Object z:a){
//			System.out.print(z + " ");
//		}
//	}
//
//}