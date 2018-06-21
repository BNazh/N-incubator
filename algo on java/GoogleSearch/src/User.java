import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.KeyCode;
import javafx.event.Event;

import java.io.*;

import java.util.*;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class User extends Application{
	String pass="";
    String loginuser="";
    PasswordField pwBox;
    TextField userTextField;
    Label pw;
    Label userName;
    
	public void start(Stage primaryStage) throws Exception{
		primaryStage.setTitle("Search");
        
        Scanner in = new Scanner(new File("name.txt"));
        TrieST<Integer> trie = new TrieST<>();
        while(in.hasNext()){
            String s = in.next().toLowerCase();
            if(trie.get(s)==null)
                trie.put(s,1);
            else{
                Integer t = trie.get(s);
                trie.put(s,t++);
            }
        }
        
		GridPane grid = new GridPane();
        grid.setAlignment(Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(25, 25, 25, 25));
        
        grid.setStyle("-fx-background-color: #4c75a3");




        userTextField = new TextField();
        userTextField.setStyle("-fx-padding:10px;");

		grid.add(userTextField, 1, 1);

        ComboBox<String> cmb = new ComboBox<>();
        //cmb.getItems().addAll(trie.keysWithPrefix("Al".toLowerCase()));
        cmb.setPrefWidth(200);

        grid.add(cmb,1,2);

        userTextField.setOnKeyPressed(new EventHandler<KeyEvent>() {
 
            public void handle(KeyEvent event) {
                if (event.getCode() == KeyCode.BACK_SPACE && userTextField.getText().length()-1 > 0) {
                    cmb.getItems().clear();
                    String s = userTextField.getText().toString().toLowerCase().trim();
                    cmb.getItems().setAll(trie.keysWithPrefix(s.substring(0, s.length() - 1)));
                    cmb.show();
                }
                else if (event.getCode().isLetterKey()) {
                    cmb.getItems().clear();
                    cmb.getItems().addAll(trie.keysWithPrefix(userTextField.getText().toString().toLowerCase().trim()+event.getText()));
                    cmb.show();
                }
                else if (event.getCode() == KeyCode.BACK_SPACE && userTextField.getText().length()-1 == 0) {
                    cmb.getItems().clear();
                    String s = userTextField.getText().toString().toLowerCase().trim();
                    cmb.hide();
                }
                else if (event.getCode() == KeyCode.BACK_SPACE && userTextField.getText().length()-1 == 0) {
                    
                }
                
            }
        });

       cmb.setOnAction((event) -> {
            String selectedPerson = cmb.getSelectionModel().getSelectedItem();
            userTextField.setText(selectedPerson);
        });
        





        final Text actiontarget = new Text();
        grid.add(actiontarget, 1, 0);



        Scene scene = new Scene(grid, 500, 475);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static int compareLogin(String userlog, String userpass){
		return 1;
	}

    public boolean isFilled(){
        boolean ok = true;
        if(userTextField.getText().isEmpty()){
            userTextField.clear();
            userTextField.setPromptText(("Please enter "+userName.getText().toLowerCase().replaceAll("[^a-zA-Z ]","")));
            ok=false;
        }
        if(pwBox.getText().isEmpty()){
            pwBox.clear();
            pwBox.setPromptText(("Please enter "+pw.getText().toLowerCase().replaceAll("[^a-zA-Z ]","")));
            ok=false;
        }
        return ok;
    }

    public boolean isValid(){
        boolean ok = true;
        if(pwBox.getText().length()<6){
            pwBox.clear();
            pwBox.setPromptText("Password length must more than 6");
            ok = false;
        }
        else if(pwBox.getText().matches("[a-zA-Z]+")^pwBox.getText().matches("[0-9]+")){
            pwBox.clear();
            pwBox.setPromptText("must contains letter and numbers");
            ok = false;
        }
        return ok&&emailValidator();
    }

    public boolean emailValidator(){
        final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(userTextField.getText());
        if(matcher.matches()==false){
            userTextField.clear();
            userTextField.setPromptText("enter valid address");
            return false;
        }
        return true;
    }
}