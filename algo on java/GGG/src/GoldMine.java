public class GoldMine {

    private int[][] goldMine = null; // Gold mine field

    public GoldMine(int[][] goldMine) {
        this.goldMine = goldMine;
    }

    public int getMaxGold() {
        // null checks
        if (goldMine == null || goldMine.length == 0) {
            return 0;
        }
        int rowLength = goldMine.length;
        int colLength = goldMine[0].length;
        // Create table for storing intermediate results and initialize all cells to 0
        // The first row of goldMineTable will give the maximum gold that the miner can collect when he starts from that row
        int[][] goldMineTable = new int[rowLength][colLength];
        for (int i = 0; i < rowLength; i++) {
            for (int j = 0; j < colLength; j++) {
                goldMineTable[i][j] = 0;
            }
        }
        for (int col = colLength - 1; col >= 0; col--) {
            for (int row = 0; row < rowLength; row++) {
                // Gold collected on going to the cell on the right (->)
                int right = col == colLength - 1 ? 0
                        : goldMineTable[row][col + 1];
                // Gold collected on going to the cell to right up (/) i.e. diagonally up
                int rightUp = (row == 0 || col == colLength - 1 ? 0
                        : goldMineTable[row - 1][col + 1]);
                // Gold collected on going to the cell to right down (\) i.e. diagonally down
                int rightDown = (row == rowLength - 1 || col == colLength - 1 ? 0
                        : goldMineTable[row + 1][col + 1]);
                // Max gold collected from taking either of the above 3 paths
                goldMineTable[row][col] = goldMine[row][col]
                        + Math.max(rightUp, Math.max(right, rightDown));
            }
        }
        int max = 0;
        // The max amount of gold collected will be the max value in first column of all rows
        for (int i = 0; i < rowLength; i++) {
            max = max < goldMineTable[i][0] ? goldMineTable[i][0] : max;
        }
        return max;
    }

    public static void main(String[] args) {

        int[][] mine = { { 1,5,2,7,9 },
                { 9,9,9,8,8 },
                { 2,9,8,9,8},
                { 1,9,9,1,2} ,
                {9,7,1,9,7}    };

        GoldMine goldMine = new GoldMine(mine);
        int maxGold = goldMine.getMaxGold();
        System.out.println(maxGold);
    }

}
