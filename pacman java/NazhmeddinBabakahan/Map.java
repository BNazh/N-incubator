import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.image.*;
import javafx.scene.paint.ImagePattern;
import javafx.geometry.Insets;
import java.io.*;
import java.util.*;

public class Map extends Pane {
    private int[][] map;
    private Position start;
    private final int unit = 50; 
    private int size;
    public static int width; //Size a mapPane

    //Constuctor for class
    Map(String s) throws FileNotFoundException 
    {
        MatrixForMap(s); 
        DrawMap(map);
        width = this.unit * this.size;
    }

    //Create map as matrix. We make a multiple array from any file//
    private void MatrixForMap(String filename) throws FileNotFoundException
    {                                                 
        Scanner fin = new Scanner(new File(filename));
        size = fin.nextInt();
        map = new int[size][size];
        for (int i = 0; i < size; i++)
        {
            for (int j = 0; j < size; j++)
            {
                map[j][i] = fin.nextInt(); 
            }
        }  
    }

    //This method can draw a map with a matrix//
    private void DrawMap(int[][] map)
    {       
        int x, y; 
        Image wall = new Image("wall.jpg");

        for (int i = 0; i < map.length; i++)
        {                   
            for (int j = 0; j < map.length; j++)
            {
                if (map[i][j] == 2) //If elements of map have 2, it give start position for player
                    start = new Position(i, j);

                x = i * unit; y = j * unit;
                Rectangle square = new Rectangle(x, y, unit, unit); 
                square.setStroke(Color.BLACK);
                //http://docs.oracle.com/javafx/2/api/javafx/scene/paint/ImagePattern.html
                //Draw wall, if element equals to 1, this rect is a wall//
                square.setFill((map[i][j]==1) ? (new ImagePattern(wall, 0, 0, 1, 1, true)):Color.DARKSALMON);
                getChildren().add(square);
            }
        }         
    }


    //return start position of player
    public Position getStartPosition(){
        return start;
    }
   
    //This method return multiple array with map
    public int[][] getMap(){     
        return this.map;        
    }

    //return width of square
    public int getUnit(){
        return this.unit;       
    }

    //return size
    public int getSize(){
        return this.size;       
    }

    //Print a multiple array 
    public static void print(int [][] map){
        for (int i = 0; i < map.length; i++){
            for (int j = 0; j < map.length; j++){
                System.out.print(map[i][j]+" ");
            }
            System.out.println();
        }
    }  
}