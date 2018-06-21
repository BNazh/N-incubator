import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.StackPane;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;
import javafx.geometry.Insets;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import java.io.*;


public class Game extends Application {
    private static String[] arguments; 
    private Label label = new Label("Your points: " + 0);
    private static final String MUSIC ="music.mp3";
   
    @Override
    public void start(Stage primaryStage) throws Exception{
    	GridPane pane = new GridPane();

    	//This game have main three class
		Map map = new Map(arguments[0]);
	    MyPlayer player = new MyPlayer(map);
	    Food food = new Food(map, player);

    	//This part for play a music//
    	Media media = new Media(new File(MUSIC).toURI().toString());
    	MediaPlayer mediaPlayer = new MediaPlayer(media);
    	mediaPlayer.play();
    	

	    //This part for label which show for us a score//
	    //I use a StackPane because, I want to put to the center// 
	    StackPane center = new StackPane();
	    label.setStyle("-fx-font-family: comicsans; -fx-font-size: 24; -fx-font-style: italic; -fx-border-width: 3;"+
	    	"-fx-border-color: black; -fx-background-color: darksalmon;");
	    center.getChildren().addAll(label);

	    pane.setPadding(new Insets(10,10,10,10));
	   	pane.setHgap(5);
	   	pane.setVgap(5);
	    pane.add(map,0,1);
	    pane.add(center,0,0);

	    //Move ball with keyboard and set a point//
	    map.setOnKeyPressed(e -> {
	        switch (e.getCode()) 
	        {
	            case DOWN:  player.moveDown(); 
	            			setPoint(food.getPoints()); 
	                        break;
	            case UP:    player.moveUp(); 
	            			setPoint(food.getPoints());
	                        break;
	            case LEFT:  player.moveLeft();
	            			setPoint(food.getPoints());
	                        break;
	            case RIGHT: player.moveRight(); 
	            			setPoint(food.getPoints());
	                        break;   
	        }
	    });

	    primaryStage.setTitle("Haunter Game");
	    Scene scene = new Scene(pane, map.width+20, map.width+80);
	    primaryStage.setScene(scene);
	    primaryStage.show();
	    map.requestFocus();
    }


    public static void main(String[] args) {
        arguments = args;
        launch(args);
    }
    //This method set a label text with current points and I use this method in KeyEvent(When we move a ball)//
    //Problems with a idea: Point don't show without moving//
    public void setPoint(int p){
        label.setText("Your points: "+ p);
    }
}