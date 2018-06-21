import java.util.*;
public class TrenirovkPoselencov {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int k = input.nextInt();
        int[] arr = new int[n+1];
        for(int i=0;i<n;i++){
            arr[i]=input.nextInt();
        }
        arr[n]=k;

        int kanwakerek=0;
        while(arr[0] !=k ){
            for(int i=0;i<n;i++){
                if(arr[i]!=k && arr[i]!=arr[i+1]){
                    arr[i]++;
                }
            }
            kanwakerek++;
        }
        System.out.print(kanwakerek);
    }
}
