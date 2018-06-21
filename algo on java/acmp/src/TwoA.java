import java.util.*;
public class TwoA {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = Integer.parseInt(input.nextLine());
        int arr[]=new int[a];
        String[] str = new String[a];
        int i=0;
        while(i<a){
            String z = input.nextLine();
            str[i] = z;
            String[] h = z.split(" ");
            arr[i] = Integer.parseInt(h[1]);

            i++;
        }
        Arrays.sort(arr);
        for(i =0 ;i<a;i++){
            if(arr[a-1]==Integer.parseInt((str[i].split(" "))[1])){
                System.out.println((str[i].split(" "))[0]);
            }
        }

    }
}
