import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.scene.paint.ImagePattern;
import javafx.scene.image.*;


public class MyPlayer implements Player{
    private Map map;
    private Position position;
    private Circle ball;

    //My variable for easy work
    private Image player = new Image("pika.gif");
    private int unit;
    private int[][] arr;
    private double ballX;
    private double ballY;
    private int x;
    private int y;

    //Constructor for MyPlayer
    MyPlayer(Map m){
        //inilized variables
        this.map = m;
        this.unit = this.map.getUnit();
        this.position = this.map.getStartPosition();
        this.arr = map.getMap();

        //variables for circle(ball)
        int radiusOfBall  = this.unit/2;
        int ballCenterX = position.getX()*unit+unit/2;
        int ballCenterY = position.getY()*unit+unit/2;

        this.ball = new Circle(ballCenterX, ballCenterY, radiusOfBall, new ImagePattern(player, 0, 0, 1, 1, true));
        this.map.getChildren().addAll(ball);
    }
    

    /*If next position in pixel of the center of ball more than size(width) of pane or less than 0, ball(player) don't move
   	  and if next element in the map as matrix equals 1, ball(player) don't move.
      All move methods works with same structure and all move methods set a position for a food*/

    //This methods override from player class methods
    //Move a ball to right direction
    @Override
    public void moveRight() {
        changeVar();

        if (ballX + unit <= map.width && arr[x + 1][y] != 1) {
                this.position.setX(x + 1);
                this.ball.setCenterX(ballX+map.getUnit());
        }
    }
    //Move a ball to left direction
    @Override
    public void moveLeft() {
        changeVar();

        if (ballX - unit >= 0 && arr [x - 1][y] != 1){ 
            this.position.setX(x - 1);
            this.ball.setCenterX(ballX - unit);
        }
    }

    //Move a ball to up direction
    @Override
    public void moveUp() {
        changeVar();

        if (ballY - unit >= 0 && arr[x][y - 1] != 1){
            this.position.setY(y - 1);
            this.ball.setCenterY(ballY - unit);
        }
    }

    //Move a ball to down direction
    @Override
    public void moveDown() {
        changeVar();
        
        if (ballY + unit <= map.width && arr[x][y + 1] != 1)
        {
            this.position.setY(y + 1);
            this.ball.setCenterY(ballY+unit);
        }
    }

    //We need regularly change a variable for condition in the move methods
    private void changeVar(){
        x = this.position.getX();
        y = this.position.getY();
        ballX = ball.getCenterX();
        ballY = ball.getCenterY();
    }
    //return current position
    @Override
    public Position getPosition(){
        return this.position;
    }
}