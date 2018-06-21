import java.io.*;
import java.util.*;

public class kurs {

    public static void main(String[] args) throws Exception {
        Scanner scn = new Scanner(System.in);


        ArrayList<String> str= new ArrayList<>();
        ArrayList<Set<String>> setstr = new ArrayList<>();
        ArrayList<Integer> list1 = new ArrayList<>();
        Set<String> l = new HashSet<>();

        while (scn.hasNext()) {
            String s = scn.next();
            String sl =scn.next();
            str.add(s+sl);
            l.add(s);
            l.add(sl);
            list1.add(scn.nextInt());
        }
        for(String i:l){
            Set<String> d = new HashSet<>();
            d.add(i);
            setstr.add(d);
        }
        int count = 0;
        while(setstr.size()>1){
            int minIndex = list1.indexOf(Collections.min(list1));

            String nodeName = str.get(minIndex);

            for(Set<String> i:setstr){
                if(i.contains(nodeName.charAt(0)+"")&&!i.contains(nodeName.charAt(1)+"")){
                    for(Set<String> j:setstr){
                        if(j.contains(nodeName.charAt(1)+"")){
                            i.addAll(j);
                            setstr.remove(j);
                            System.out.print(nodeName+" ");
                            count +=list1.get(minIndex);
                            break;
                        }
                    }
                    break;
                }
            }

            list1.remove(Collections.min(list1));
            str.remove(minIndex);
        }
        System.out.println();
        System.out.println(count);
    }
}