public class eight {
    public static void main(String[] args) {
        int[] y={1,5,8,9,10,17,17,20};

        System.out.println(profit(y,y.length));
        //goat();
    }

    public static int profit(int[] value, int length) {
        if (length <= 0)
            return 0;
        // either we will cut it or don't cut it
        int max = -1;
        for(int i=0;i<length;i++)
            max = Math.max(max, value[i] + profit(value, length-(i+1)));
        return max;
    }
    public static void goat(){
        int[][] a={ {1,1,1,1},
                {1,2,0,0},
                {1,0,0,0},
                {1,0,0,0}};
        int[][] b=new int [4][4];
        int ways=0;
        int dead=0;
        for(int i=1;i<4;i++){
            ways=0;
            for(int j=1;j<4;j++){
                ways=a[i-1][j]+a[i][j-1];
                if(a[i-1][j]==2 || a[i][j-1]==2){
                    dead+=ways;
                }
                else{b[i][j]=ways;}
            }
        }
        for(int i=1;i<4;i++){
            for(int j=1;j<4;j++) {
                System.out.println(b[i][j]);
            }
        }
        System.out.println(dead);
    }

}
