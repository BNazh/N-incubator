import java.util.Scanner;
import java.util.Stack;
public class homework4{
	public static void main(String[] args){
		Scanner a = new Scanner(System.in);
		String  j = a.nextLine();
		//System.out.println(j);
		Stack<Integer> stack = new Stack<Integer>();
		String[] mas=j.split(" ");
		
		String opr="+-/*";
		for(String h:mas){
			//System.out.println(h);
			if(!opr.contains(h)){
				stack.push(Integer.parseInt(h));
			}
			else{
				int x=stack.pop();
				int y=stack.pop();
				
				switch(h){
					case "+":	stack.push(x+y);break;
					case "-":	stack.push(y-x);break;
					case "/":	stack.push(y/x);break;
					case "*":	stack.push(x*y);break;
					
				}
				
			}
			
			
		}
		System.out.println(stack.pop());
		
		
		
	}
}