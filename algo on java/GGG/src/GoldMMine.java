public class GoldMMine {
    public static void main(String[] args) {
        int[][] mine = { {7,8,9,4},{4,5,6,9},{1,2,3,7} };


        int rowLength = mine.length;
        int colLength = mine[0].length;
        int[][] goldMineTable =new int [rowLength][colLength];
        int[][] goldMineTable1 =new int [rowLength][colLength];
        for (int i = 0;  i<mine.length; i++) {
            for (int j = 0;  j<mine[0].length; j++) {
                goldMineTable[i][j]=mine[i][j];
                goldMineTable1[i][j] =mine[i][j];
            }
        }

        for (int i = mine.length-1;  i>=0; i--) {
            for (int j = 1;  j<mine[0].length; j++) {
                int right = goldMineTable[i][j- 1];
                int rightUp = (i==0  ? 0: goldMineTable[i - 1][j - 1]);
                int rightDown =(i==mine.length-1 ?0: goldMineTable[i + 1][j - 1]);

                goldMineTable[i][j] = goldMineTable[i][j] + Math.max(rightUp, Math.max(right, rightDown));

            }
        }
        for (int i = 0;  i<mine.length; i++) {
            for (int j = 1;  j<mine[0].length; j++) {
                int right = goldMineTable1[i][j- 1];
                int rightUp = (i==0  ? 0: goldMineTable1[i - 1][j - 1]);
                int rightDown =(i==mine.length-1 ?0: goldMineTable1[i + 1][j - 1]);

                goldMineTable1[i][j] = goldMineTable1[i][j] + Math.max(rightUp, Math.max(right, rightDown));

            }
        }


        int max = 0;
        int max1=0;

        for (int i= colLength-1;  i>=0; i--) {
            for (int j = rowLength-1;  j>=0; j--) {
                max=Math.max(max,goldMineTable[j][i]);
                max1=Math.max(max1,goldMineTable1[j][i]);
            }
        }
        System.out.println(Math.max(max,max1));
        System.out.println();
        pr(goldMineTable);
        System.out.println();
        pr(goldMineTable1);
        System.out.println();
        pr(mine);
        System.out.println();
    }
    public static void pr(int[][] a){
        for(int i=0;i<a.length;i++){
            for(int j=0;j<a[0].length;j++){
                System.out.print(a[i][j]+" ");
            }
            System.out.println();
        }
    }

}
