import java.util.*;
public class Kurskal {


        static int [][]a={{0,4,0,0,0,0,0,8,0},
                {4,0,8,0,0,0,0,11,0},
                {0,8,0,7,0,4,0,0,2},
                {0,0,7,0,9,14,0,0,0},
                {0,0,0,9,0,10,0,0,0},
                {0,0,4,14,10,0,2,0,0},
                {0,0,0,0,0,2,0,1,6},
                {8,11,0,0,0,0,1,0,7},
                {0,0,2,0,0,0,6,7,0}};
        public static void main(String []args){
            ArrayList<String> points = new ArrayList<>();
            ArrayList<Integer> points_pow = new ArrayList<>();
            ArrayList<Set<String>> points_set = new ArrayList<>();
            for(int i=0;i<a.length;i++){
                for (int j=0;j<a.length;j++){
                    if(a[i][j]!=0){
                        points.add(""+(i+1)+(j+1));
                        points_pow.add(a[i][j]);
                    }
                }

                Set<String> set = new HashSet<>();
                set.add(""+(i+1));
                points_set.add(set);
            }
            while (points_set.size()>1){
                int pp = Collections.min(points_pow);
                String p = points.get(points_pow.indexOf(pp));
                points_pow.remove(points_pow.indexOf(pp));
                points.remove(p);
                for(Set<String> i:points_set){
                    if(i.contains(p.substring(0,1)) && !i.contains(p.substring(1))){
                        for (Set<String> j:points_set){
                            if(j.contains(p.substring(1))){
                                i.addAll(j);
                                points_set.remove(j);
                                System.out.print(p+" ");
                                break;
                            }
                        }
                        break;
                    }
                }
            }

        }

}
