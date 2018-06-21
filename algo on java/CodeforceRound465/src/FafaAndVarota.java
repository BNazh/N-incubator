import java.util.*;
public class FafaAndVarota {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        String arr = input.next().substring(0,n);
        int count = 0;
        int x = 0,y = 0;
        for(int i = 0;i<n;i++){
            if((arr.charAt(i)+"").equals("U")){
                y++;
                if( x == y  && x != 0 && y != 0  && y-1 != 0){
                    count++;

                    System.out.println(arr.charAt(i)+"" +i+ count);
                }
            }
            else{
                x++;
                if( x  == y && x != 0 && y != 0 && x-1 != 0 ){
                    count++;

                    System.out.println(arr.charAt(i)+"" +i+count);
                }
            }
        }
        System.out.println(count);
    }
}
