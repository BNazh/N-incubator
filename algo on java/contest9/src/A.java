import java.util.*;
public class A {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int[] a = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824};
        int n = input.nextInt();
        int[] arr = new int[n];
        for(int i=0;i<n;i++){
            arr[i] = input.nextInt();
        }
        int[] mas = new int[n];
        HashMap<Integer, Integer> map = new HashMap<>();
        int i = 0;
        while(i<n){
            if(map.containsKey(arr[i])){
                map.put(arr[i], map.get(arr[i]) + 1);}
            else{
                map.put(arr[i], 1);}
            i++;
        }
        long res = 0;
        for(int nu : arr){
            for(int p : a){
                if(p <= nu) continue;
                if(map.containsKey(p-nu)) {
                    res += map.get(p-nu);
                    if(p-nu == nu) res--;
                }
            }
        }
        System.out.println(res/2);

    }



}

