import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.application.Platform;
import javafx.scene.control.Label;

public class BotPlayer implements Player{
	private Map map;
    private static Food food;
	private Position position;
	private Circle ball;
    private int unit;
    private int[][] mapArray;
    private double ballX;
    private double ballY;
    private int botX;
    private int botY;
    private int x;
    private int y;
    //private static int direction = 0;
    private static boolean right = true;

	BotPlayer(Map m, Label label){
        this.food = new Food(m, this);
		this.map = m;
		this.unit = this.map.getUnit();
		this.position = this.map.getStartPosition();
    	this.mapArray = map.getMap();

		int radiusOfBall  = this.unit/2;
		int ballCenterX = position.getX()*unit+unit/2;
		int ballCenterY = position.getY()*unit+unit/2;

		this.ball = new Circle(ballCenterX, ballCenterY, radiusOfBall, Color.CRIMSON);
		this.map.getChildren().addAll(ball);
        try{moveAuto(food, label);}
        catch(Exception e){} 
        //moveAuto(food, label);
	}
    BotPlayer(Map m, Label label, boolean first){
        this.food = new Food(m, this);
        this.map = m;
        this.unit = this.map.getUnit();
        this.position = this.map.getStartPosition();
        this.mapArray = map.getMap();

        int radiusOfBall  = this.unit/2;
        int ballCenterX = position.getX()*unit+unit/2;
        int ballCenterY = position.getY()*unit+unit/2;

        this.ball = new Circle(ballCenterX, ballCenterY, radiusOfBall, Color.CRIMSON);
        this.map.getChildren().addAll(ball);

        likeSnake(food, label);
    }
    @Override
    public Position getPosition(){return this.position;}
 
    @Override
    public void moveRight() {
        changeVar();

        if (ballX + unit <= map.width && mapArray[x + 1][y] != 1) {
                this.position.setX(x + 1);
                this.ball.setCenterX(ballX+map.getUnit());
        }
    }
    //Move a ball to left direction
    @Override
    public void moveLeft() {
        changeVar();

        if (ballX - unit >= 0 && mapArray [x - 1][y] != 1){ 
            this.position.setX(x - 1);
            this.ball.setCenterX(ballX - unit);
        }
    }

    //Move a ball to up direction
    @Override
    public void moveUp() {
        changeVar();

        if (ballY - unit >= 0 && mapArray[x][y - 1] != 1){
            this.position.setY(y - 1);
            this.ball.setCenterY(ballY - unit);
        }
    }

    //Move a ball to down direction
    @Override
    public void moveDown() {
        changeVar();

        if (ballY + unit <= map.width && mapArray[x][y + 1] != 1)
        {
            this.position.setY(y + 1);
            this.ball.setCenterY(ballY+unit);
        }
    }

    private void changeVar(){
        x = this.position.getX();
        y = this.position.getY();
        ballX = ball.getCenterX();
        ballY = ball.getCenterY();
    }
    public void likeSnake(Food food, Label label){
        if(right){
            this.position.setX(0);
            this.position.setY(0);
            this.ball.setCenterX(unit/2);
            this.ball.setCenterY(unit/2);
            right = false;
        }
        try {new Thread().sleep(500);}
        catch (Exception e) {}
        new Thread(()->
        {
            for(int i = 0; i < map.getSize(); i++)
            {
                try {new Thread().sleep(300);}
                catch (Exception e) {}
                for (int j = 0; j < map.getSize(); j++)
                {
                    Platform.runLater(() -> {
                        label.setText("Your points: "+ food.getPoints());
                    });
                    System.out.println(food.getPosition().getX()+" "+food.getPosition().getY()+" "+getPosition());
                    if(food.getPosition().equals(getPosition())){return;}
                    else if(i % 2 == 0) {moveRight();}
                    else {moveLeft();}
                    try {new Thread().sleep(300);}
                    catch (Exception e) {}
                }
                moveDown();
                try {new Thread().sleep(300);}
                catch (Exception e) {}
            }
        }).start();
    }

    class Next{
        private int i;
        private int j;
        private int t;
        private int [][] path;
        Next(int i, int j, int t){
            path = new int[map.getSize()][map.getSize()];
            try{next(i, j, t);}
            catch(Exception e){}            
        }

        public void next(int i, int j, int t) throws Exception{            
            if(i < path.length && j < path.length && i >= 0 && j >= 0 && map.getGap()[i][j]!=1)
            {
                if(path[j][i] == 0)
                {
                    path[j][i] = t;
                    next(i+1,j,t+1); next(i-1,j,t+1); next(i,j+1,t+1); next(i,j-1,t+1);
                }
                else if(path[j][i] > t)
                {
                    path[j][i] = t;
                    next(i+1,j,t+1); next(i-1,j,t+1); next(i,j+1,t+1); next(i,j-1,t+1);
                }
                else return;
            }
        }

        public int getElementOfPath(Position p)
        {
            return getPath()[p.getY()][p.getX()];
        }
        public int[][] getPath(){
            return this.path;
        }
    }

    public void moveAuto(Food food, Label label) throws Exception
    {
        new Thread(()->
        {
            Platform.runLater(() -> {
                    label.setText("Your points: "+ food.getPoints());
            });
            Next next = new Next(food.getPosition().getX(), food.getPosition().getY(), 3);
            
            try {new Thread().sleep(200);}
            catch (Exception e) {}

            int qt = next.getElementOfPath(getPosition());
            int min = qt;
            String direction = "";

            for(int i = 0; i < qt - 1; i++)
            {
                if( getPosition().getX() + 1 < map.getSize() && 
                    next.getElementOfPath(new Position(getPosition().getX()+1, getPosition().getY()))!=0 && 
                    next.getElementOfPath(new Position(getPosition().getX(),getPosition().getY()))!=3)
                {
                    min = next.getElementOfPath(new Position(getPosition().getX()+1, getPosition().getY()));
                    direction = "RIGHT";
                }
                if( getPosition().getX() - 1 >= 0 && 
                    next.getElementOfPath(new Position(getPosition().getX()-1, getPosition().getY())) < min && 
                    next.getElementOfPath(new Position(getPosition().getX()-1, getPosition().getY()))!=0 && next.getElementOfPath(new Position(getPosition().getX(),getPosition().getY()))!=3)
                {
                    min = next.getElementOfPath(new Position(getPosition().getX()-1, getPosition().getY()));
                    direction = "LEFT";
                }
                if( getPosition().getY() + 1 < map.getSize() && 
                    next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()+1)) < min && 
                    next.getElementOfPath(new Position(getPosition().getX(),getPosition().getY()+1))!=0 && 
                    next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()))!=3)
                {
                    min = next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()+1));
                    direction = "DOWN";
                }
                if( getPosition().getY() - 1 >= 0 && 
                    next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()-1)) < min && 
                    next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()-1))!=0 && 
                    next.getElementOfPath(new Position(getPosition().getX(), getPosition().getY()))!=3)
                {
                    min = next.getElementOfPath(new Position(getPosition().getX(),getPosition().getY()-1));
                    direction = "UP";
                }

                try {Thread.sleep(200);}
                catch (InterruptedException e) {e.printStackTrace();}

                if(direction == "RIGHT")    {moveRight();direction = "";}
                else if(direction == "LEFT")  {moveLeft();direction = "";}
                else if(direction == "DOWN")  {moveDown();direction = "";}
                else if(direction == "UP")  {moveUp();direction = "";}
                
            }
            
            try{moveAuto(food, label);}
            catch(Exception e){}

        }).start();
        
    }

    
}