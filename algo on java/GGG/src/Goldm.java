public class Goldm {
    public static void main(String[] args) {
        int[][] mine = { {7,8,9},{4,5,6},{1,2,3} };


        int rowLength = mine.length;
        int colLength = mine[0].length;

        int[][] goldMineTable1 =new int [rowLength][colLength];
        for (int i = 0;  i<mine.length; i++) {
            for (int j = 0;  j<mine[0].length; j++) {

                goldMineTable1[i][j] =mine[i][j];
            }
        }

        int max1=0;
        for (int i = 0;  i<mine.length; i++) {


            for (int j = 0;  j<mine[0].length-1; j++) {
                int right=0;
                int rightUp=0;
                int rightDown=0;

                right = goldMineTable1[i][j + 1];
                rightUp = (i==0 || j==mine[0].length-1 ? 0: goldMineTable1[i - 1][j + 1]);
                rightDown =(j==mine.length-1 || i==mine.length-1 ?0: goldMineTable1[i + 1][j + 1]);

                Math.max(rightUp, Math.max(right, rightDown));


               // if(z==rightUp){ goldMineTable1[i-1][j+1]=goldMineTable1[i][j]+z; }
                //else if(z==right){ goldMineTable1[i][j+1]=goldMineTable1[i][j]+z; }
               // else{ goldMineTable1[i+1][j+1]=goldMineTable1[i][j]+z;}

            }
        }


        System.out.println(max1);
        System.out.println();
        pr(goldMineTable1);
        System.out.println();
        pr(mine);
        System.out.println();
    }
    public static int max(int[][] hh){
        int max1=0;
        for (int i= hh.length-1;  i>=0; i--) {
            for (int j = hh.length-1;  j>=0; j--) {

                max1=Math.max(max1,hh[j][i]);
            }
        }
        return max1;
    }
    public static void pr(int[][] a){
        for(int i=0;i<a.length;i++){
            for(int j=0;j<a.length;j++){
                System.out.print(a[i][j]+" ");
            }
            System.out.println();
        }
    }

}
