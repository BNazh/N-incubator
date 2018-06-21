public class Head {
    static int[] lookup;
    final static int NIL = -1;

    public static void main(String[] args) {
        //j(50);
       // long u = System.currentTimeMillis();
        //j(1000);
        // System.out.println(f(1000));
//         // System.out.println(solv(25));
       // long z = System.currentTimeMillis();
       // System.out.println(z - u);

        //int[] a={6,5,4,8,3,2,4,5,6};
        //System.out.println(DecreasingSequence(a));
        System.out.println(longestSubstr("abat","batq"));
//        u=System.currentTimeMillis();
//        System.out.println(fib(1000));
////
//        z=System.currentTimeMillis();
//        System.out.println(z-u);
    }

    public static void j(int z) {
        lookup = new int[z + 1];

    }

    //memalization
    public static int f(int n) {

        if (lookup[n] == 0) {
            if (n <= 1) lookup[n] = n;
            else {
                lookup[n] = f(n - 1) + f(n - 2);
            }

        }
        return lookup[n];

    }
//
//    //sample fib
    public static int fi(int n) {
        if (n == 0) return 0;
        if (n == 1) return 1;
        return fi(n - 1) + fi(n - 2);
    }
//
////    //tabulation
    public static int fib(int n) {
        int f[] = new int[n + 1];
        f[0] = 0;
        f[1] = 1;
        for (int i = 2; i <= n; i++)
            f[i] = f[i - 1] + f[i - 2];
        return f[n];
    }
//
//    public static int solve(int n) {
//
//        if(n<0)return 0;
//        if (n == 0) return 1;
//        return solve(n - 2) + solve(n - 3) + solve(n - 5);
//    }
//    //tabulation
//    public static int solv(int n) {
//        int f[] = new int[n +1];
//        f[0] = 1;
//        f[1] = 0;
//        for (int i = 2; i <= n; i++)
//            f[i]=solve(n - 2) + solve(n - 3) + solve(n - 5);
//        return f[n];
//    }
//    //memaliza
//    public static int solv1(int n) {
//
//        lookup[0] = 1;
//        lookup[1] = 0;
//        for (int i = 2; i <= n; i++)
//            lookup[i]=solve(n - 2) + solve(n - 3) + solve(n - 5);
//        return  lookup[n];
//    }
    public static int DecreasingSequence(int [] arr){
        int[] b=new int[arr.length];
        for(int i=0;i<arr.length;i++){
            b[i]=1;
        }

        for(int i=0;i<arr.length;i++){
            for(int j=0;j<i;j++){
                if(arr[i]<arr[j] && b[i]<b[j]+1)
                    b[i]=b[j]+1;
            }
        }


        int max=0;
        for(int i=0;i<b.length;i++){
            if(b[i]>max)
                max=b[i];
        }
        return max;
    }
//
//    public static void Rectangle(int[][] arr){
//        int rightSum=0;
//        int downSum=arr[0][0];
//        int total=0;
//        for(int i=0;i<arr.length;i++){
//            for(int j=0;j<arr.length;j++){
//                if(i==0){
//                    rightSum+=arr[i][j];
//                }
//                else if(j==0){
//                    downSum+=arr[i][j];
//                    arr[i][j]=downSum;
//                }
//                else{
//                    total=(arr[i-1][j]+arr[i][j-1]+arr[i][j])+arr[i-1][j-1];
//                    arr[i][j]=total;
//                }
//            }
//        }
//        System.out.println(arr[arr.length-1][arr.length]);
//
//    }
    public static int longestSubstr(String first, String second) {
        int maxLen = 0;
        int fl = first.length();
        int sl = second.length();
        int[][] table = new int[fl+1][sl+1];

        for (int i = 1; i <= fl; i++) {
            for (int j = 1; j <= sl; j++) {
                if (first.charAt(i-1) == second.charAt(j-1)) {
                    table[i][j] = table[i - 1][j - 1] + 1;
                    if (table[i][j] > maxLen)
                        maxLen = table[i][j];
                }
            }
        }
        return maxLen;
    }




}
