public class Recur {
    public static void main(String[] args) {
        System.out.println(Fib(5));
    }
    public static int Fib(int a){
        if(a==1)return 1;
        if(a==0)return 0;
        return Fib(a-1)+Fib(a-2);
    }
}
