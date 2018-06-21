import java.util.*;
import java.io.*;
public class PolishNotation{
	
	public static void main(String [] args){
		

		Scanner in = new Scanner(System.in);
		
		

		String m=in.nextLine();
		String [] array = m.split(" "); 
		
		

		//ToPostFix(array);
				
		System.out.println(reversePolish(array));	

	}
	

	
   public static int reversePolish(String[] array) {
        
        Stack<Integer> stack = new Stack<>();
        // 4 5 + 4 2 - +
        // 9 4 2 / -
        for (int i = 0; i < array.length; i++) {
            if (array[i].matches("-?[\\d]+")) {
                stack.push(Integer.parseInt(array[i]));
            } else {
                int op2 = stack.pop();
                int op1 = stack.pop();
                int result = 0;
                String operator = array[i];
                
                if (operator.equals("+")){
                 	result = op1 + op2;
             	}
                else if (operator.equals("-")) {
                	result = op1 - op2;
                }
                else if (operator.equals("*")){
					result = op1 * op2;
				}
                else if (operator.equals("/")) {
                	result = op1 / op2;
                }
                
                stack.push(result);
            }
        }
        return stack.pop();
    }
	



public static void ToPostFix(String [] array){
		// 4 + 2 - 2 * 1 
		// 4 2 + 2  - 
		Stack stack = new Stack();
		Stack stack1 = new Stack();
		int z=0;	
		int m =0;	
		for(int i =0;i<array.length;i++){
			if(array[i].matches("-?[\\d]+")){
				stack.push(Integer.parseInt(array[i]));
					m++;
					if(z!=0){
						stack.push(array[z]);
						z=0;
						m=0;
					}
					
				}
			else{

					if(m%2==0){
						stack.push(array[i]);

						m=0;	
					}else{
						z=i;
					}
				}

		}
	

	ArrayList list =new ArrayList();
	for(int i = 0; i<array.length;i++){	
			list.add(stack.pop());
			//System.out.print(stack.pop()+" ");
		}
		int value = 0;
	for(int i=list.size()-1;i>=0;--i){
			System.out.print(list.get(i)+" ");
		

		}

}


    
}
 