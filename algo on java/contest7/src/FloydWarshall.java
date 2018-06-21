import java.util.*;
class FloydWarshall {
	public static void main(String[] args) throws Exception {

		Scanner scn = new Scanner(System.in);
		int a = scn.nextInt();
		int a1 = scn.nextInt();
		int[][] matrix = new int[a1][a1];
		for (int i = 0; i < matrix[0].length; i++) {
				matrix[scn.nextInt()][scn.nextInt()] = (int) Math.pow(2,(double) scn.nextInt());

		}

		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[0].length; j++) {
				if(matrix[i][j]==0){
					matrix[i][j]=Integer.MAX_VALUE;
				}
			}
		}

		for (int k = 0; k <  matrix[0].length; k++) {
			for (int j = 0; j < matrix[0].length; j++) {
				for (int i = 0; i < matrix[0].length; i++) {
					if(matrix[i][k] + matrix[k][j] < matrix[i][j])
						matrix[i][j] = matrix[i][k] + matrix[k][j];
				}
			}
		}

		for (int i1 = 0; i1 < matrix.length; i1++) {
			for (int j = 0; j < matrix[0].length; j++) {
				System.out.print(matrix[i1][j]+" ");
			}
			System.out.println();
		}
	}
}