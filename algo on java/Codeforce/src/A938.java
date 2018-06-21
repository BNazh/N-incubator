import java.util.Scanner;
public class A938 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = input.nextInt();
        StringBuffer str = new StringBuffer(a);
        String z ="aeiouy";
        String s = (input.next()).substring(0,a);
        String ans = "";
        for(int i = 0; i< s.length()-1 ; i++){
            if((s.charAt(i)=='a'||s.charAt(i)=='e'||s.charAt(i)=='i'||s.charAt(i)=='o'||s.charAt(i)=='u'||s.charAt(i)=='y')&&(s.charAt(i+1)=='a'||s.charAt(i+1)=='e'||s.charAt(i+1)=='i'||s.charAt(i+1)=='o'||s.charAt(i+1)=='u'||s.charAt(i+1)=='y')){
                str = str.delete(i+1,i+2);
                i--;
            }

        }
        System.out.println(""+str);
    }
}
