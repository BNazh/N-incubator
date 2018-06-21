import java.util.*;
import java.io.*;


public class qw{ //имя класса должно быть Main
    public static void main(String[] argv) throws IOException{
        new qw().run();
    }
    PrintWriter pw;
    Scanner sc;
    public void run() throws IOException{
        sc = new Scanner(System.in);
        sc = new Scanner(System.in);
        byte a  = sc.nextByte();
        ArrayList<Byte> arr = new  ArrayList<Byte>();
        ArrayList<Byte> arr1 =new  ArrayList<Byte>();
        int count = 0;
        while(count<a){
            byte number = sc.nextByte();
            if(number%2==0){arr.add(number);}
            else{arr1.add(number);}

            count++;
        }
        pw = new PrintWriter(new File("output.txt"));
        for(byte i:arr1){
            pw.print(i+" ");
        }
        System.out.println();
        for(byte i:arr){
            pw.print(i+" ");
        }
        pw.println();
        pw.print(arr.size()>=arr1.size()?"YES":"NO");

        pw.close();
    }
}