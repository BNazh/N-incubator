import javafx.application.Application;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;

import java.io.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;

public class SecondStage extends Stage {
    VBox y = new VBox();
    TextField[] info = new TextField[7];
    Label[] word = new Label[7];
    DatePicker date;

    SecondStage(Stage stage){
        GridPane grid = new GridPane();
        grid.setAlignment(Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(25, 25, 25, 25));
        grid.setStyle("-fx-background-color: #4c75a3");
    
        Label u1= new Label("First Name:");
        u1.setTextFill(Color.WHITE);
        u1.setStyle("-fx-font-size:20px;");
        grid.add(u1, 0, 1);
        word[0] = u1;
        TextField fname = new TextField();
        fname.setStyle("-fx-padding:10px;");
        grid.add(fname, 1, 1);
        info[0] = fname;
    
        Label u2 = new Label("Last Name:");
        u2.setTextFill(Color.WHITE);
        u2.setStyle("-fx-font-size:20px;");
        grid.add(u2, 0, 2);
        word[1] = u2;
        TextField lname = new TextField();
        lname.setStyle("-fx-padding:10px;");
        grid.add(lname, 1, 2);
        info[1] = lname;        

        Label u3= new Label("Date Of Birth:");
        u3.setTextFill(Color.WHITE);
        u3.setStyle("-fx-font-size:20px;");
        grid.add(u3, 0, 3);
    	  date = new DatePicker();
        date.setStyle("-fx-padding:10px;");
        grid.add(date, 1, 3);
        
    	Label u4= new Label("Email:");
        u4.setTextFill(Color.WHITE);
    	u4.setStyle("-fx-font-size:20px;");
        grid.add(u4, 0, 4);
        word[2] = u4;
    	TextField eadd = new TextField();
    	eadd.setStyle("-fx-padding:10px;");
        grid.add(eadd, 1, 4);
    	info[2] = eadd;

      	Label u6= new Label("Password:");
      	u6.setTextFill(Color.WHITE);
        u6.setStyle("-fx-font-size:20px;");
        grid.add(u6, 0, 6);
        word[3] = u6;
        PasswordField pwBox = new PasswordField();
      	pwBox.setStyle("-fx-padding:10px;");
        grid.add(pwBox, 1, 6);
        info[3] = pwBox;  

        Label u7= new Label("Confirm Password:");
      	u7.setTextFill(Color.WHITE);
        u7.setStyle("-fx-font-size:20px;");
        grid.add(u7, 0, 7);
        word[4] = u7;
        PasswordField pwBox1 = new PasswordField();
      	pwBox1.setStyle("-fx-padding:10px;");
        grid.add(pwBox1, 1, 7);
        info[4] = pwBox1;

        Label u8= new Label("Country:");
      	u8.setTextFill(Color.WHITE);
        u8.setStyle("-fx-font-size:20px;");
        grid.add(u8, 0, 8);
        word[5] = u8;
      	TextField sadd = new TextField();
      	sadd.setStyle("-fx-padding:10px;");
        grid.add(sadd, 1, 8);
        info[5] = sadd;
      	
      	Label u9= new Label("City");
      	u9.setTextFill(Color.WHITE);
        u9.setStyle("-fx-font-size:20px;");
        grid.add(u9, 0, 9);
        word[6] = u9;
      	TextField sanw = new TextField();
      	sanw.setStyle("-fx-padding:10px;");
        grid.add(sanw, 1, 9);
        info[6] = sanw;

      	Button submit = new Button("Sign up");
        HBox hbBtn = new HBox(10);
        hbBtn.setAlignment(Pos.BOTTOM_CENTER);
        hbBtn.getChildren().add(submit);
        grid.add(hbBtn, 1, 10);
        submit.setMaxWidth(200);
        submit.setStyle("-fx-background-color: #ffffff;-fx-text-fill: #4c75a3;-fx-font-size:20px;");
      
      	Label u10= new Label("Registration");
        u10.setFont(Font.font("Gill Sans Ultra Bold", FontWeight.NORMAL, 20));
        u10.setTextFill(Color.WHITE);
      	grid.add(u10, 0, 0);
            
        final Text actiontarget = new Text();
        grid.add(actiontarget, 1, 0);
            
        submit.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent event){
                File base = new File("users.dat");
                File name = new File("name.txt");
                if(!base.exists()){
                    try{
                        DataOutputStream output = new DataOutputStream(new FileOutputStream("users.dat"));
                    }
                    catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
                boolean ok = false;
                if(isFilled())
                    ok = isValid();
                if(ok){
                    String loginuser = fname.getText();
                    String pass = pwBox.getText();
                    String last = lname.getText();
                    String dob = (((TextField)date.getEditor()).getText());
                    String email=eadd.getText();
                    String sques = sadd.getText();
                    String sans = sanw.getText();
                    if(!compareUname(loginuser)){
                        insertData(loginuser, pass, last, dob, email, sques, sans );
                        actiontarget.setFill(Color.FIREBRICK);
                        actiontarget.setText("New user created successfully.");
                        stage.close();
                        new welcome(loginuser, pass);
                        try{
                            PrintStream print = new PrintStream(new FileOutputStream(new File("name.txt"), true)); 
                            print.println(loginuser);
                            print.close();
                        }
                        catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                    else{
                        fname.clear();
                        actiontarget.setFill(Color.FIREBRICK);
                        actiontarget.setText("User name already in use. Choose Another user name.");
                    }
                   
                }
                   
            }
                
        });
            
       stage.setScene(new Scene(grid, 600, 600));
       stage.show();
    }  


    public static boolean compareUname(String s){
        return false;
    }

    public static void insertData(String userlog, String userpass, String lname, String dob, String email, String sques, String sanw){
    	
    }

    public boolean isFilled(){
        boolean ok = true;
        for(int i=0;i<info.length;i++){
            if(info[i].getText().isEmpty()){
                info[i].setPromptText(("Please enter "+word[i].getText().toLowerCase().replaceAll("[^a-zA-Z ]","")));
                ok=false;
            }
        }
        if(date.getValue()==null){
            date.setPromptText("Please enter birthdate");
            ok=false;
        }
        return ok;
    }
    public boolean isValid(){
        boolean ok = true;
        if(info[3].getText().length()<6){
            info[3].clear();
            info[4].clear();
            info[3].setPromptText("Password length must more than 6");
            info[4].setPromptText("Password length must more than 6");
            ok = false;
        }
        else if(!info[3].getText().equals(info[4].getText())){
            info[3].clear();
            info[4].clear();
            info[3].setPromptText("Different passwords");
            info[4].setPromptText("Different passwords");
            ok = false;
        }
        else if(info[3].getText().matches("[a-zA-Z]+")^info[3].getText().matches("[0-9]+")){
            info[3].clear();
            info[3].setPromptText("must contains letter and numbers");
            ok = false;
        }


        if(!info[0].getText().matches("[a-zA-Z]+")){
            info[0].clear();
            info[0].setPromptText("Name must contain letters");
            ok = false;
        }
        if(!info[1].getText().matches("[a-zA-Z]+")){
            info[0].clear();
            info[0].setPromptText("Last must contain letters");
            ok = false;
        }
        if(!info[5].getText().matches("[a-zA-Z]+")){
            info[5].clear();
            info[5].setPromptText("Name must contain letters");
            ok = false;
        }
        if(!info[6].getText().matches("[a-zA-Z]+")){
            info[6].clear();
            info[6].setPromptText("Last must contain letters");
            ok = false;
        } 
        if(emailValidator()==false){
            ok=false;
            info[2].clear();
            info[2].setPromptText("enter valid address");
        }
        return ok;       
    }

    public boolean emailValidator(){
        final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(info[2].getText());
        return matcher.matches();
    }
}
