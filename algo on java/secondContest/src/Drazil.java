import java.util.*;
public class Drazil {
    public static void main(String[] args) {
       Scanner input = new Scanner(System.in);
       int a = input.nextInt();
       int[] arr = new int[100000];
       String str = (input.next()).substring(0,a);
       char[] l = str.toCharArray();
       int t=0;

       for(int i=0;i<a;i++){
           if(l[i]=='1' || l[i]=='0')continue;
           else if(l[i]=='2') arr[t++]=2;
           else if(l[i]=='3') arr[t++]=3;
           else if(l[i]=='4'){
               arr[t++]=2;
               arr[t++]=2;
               arr[t++]=3;
           }
           else if(l[i]=='5') arr[t++]=5;
           else if(l[i]=='6'){ arr[t++]=5; arr[t++]=3;}
           else if(l[i]=='7') arr[t++]=7;
           else if(l[i]=='8')
           {
               arr[t++]=7;
               arr[t++]=2;
               arr[t++]=2;
               arr[t++]=2;
           }
           else if(l[i]=='9'){
               arr[t++]=7;
               arr[t++]=2;
               arr[t++]=3;
               arr[t++]=3;
           }

       }
        Arrays.sort(arr);

        for(int i= arr.length-1;i>=arr.length-t;i--)
        {
            System.out.print(arr[i]);
        }

    }
}
