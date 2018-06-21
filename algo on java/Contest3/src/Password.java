import java.util.*;
public class Password {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String text = input.nextLine();
        String otvet = "",prefix ="",suffix="";
        String razmer = "";
        if(text.length()>10){
            System.out.println("Just a legend");
        }
        else{
            for (int i = 1; i < text.length(); i++) {
                prefix = text.substring(0, i);

                suffix = text.substring(text.length() - i);
                if (!prefix.equals(suffix)) {
                    continue;
                }
                if (!text.substring(1, text.length() - 1).contains(prefix)) {
                    continue;
                }

                otvet = prefix;
                if (razmer.length() < otvet.length()) {
                    razmer = otvet;
                }
            }

            System.out.println(otvet.length() > 0 ? razmer : "Just a legend");
        }
    }
}
