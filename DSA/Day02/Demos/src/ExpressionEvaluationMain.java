
public class ExpressionEvaluationMain {
	public static int calculate(int op1, char opr, int op2) {
		switch(opr) {
		case '+': return op1 + op2;
		case '-': return op1 - op2;
		case '*': return op1 * op2;
		case '/': return op1 / op2;
		case '%': return op1 % op2;
		case '$': return (int)Math.pow(op1, op2);
		}
		return 0;
	}
	
	public static int evaluatePostfix(String postfix) {
		//0. create stack to push operands
		int st[] = new int[10];
		int top = -1;
		//1. process elements from left to right
		for(int i = 0 ; i < postfix.length() ; i++) {
			//2. Extract element of ith index
			char element = postfix.charAt(i);
			//3. if element is operand, push it on stack
			if(Character.isDigit(element))
				st[++top] = element - '0';	// to convert character into number
			//4. if element is oprator
			else {
				//4.1 pop two elements from the stack
				int op2 = st[top--];
				int op1 = st[top--];
				//4.2 perform operation of op1 and op2
				int res = calculate(op1, element, op2);
				//4.3 push result on stack
				st[++top] = res;
			}
		}
		//5. peek result from stack and return it
		return st[top];
	}
	
	public static int evaluatePrefix(String prefix) {
		//0. create stack to push operands
		int st[] = new int[10];
		int top = -1;
		//1. process elements from right to left
		for(int i = prefix.length() - 1 ; i >= 0 ; i--) {
			//2. Extract element of ith index
			char element = prefix.charAt(i);
			//3. if element is operand, push it on stack
			if(Character.isDigit(element))
				st[++top] = element - '0';	// to convert character into number
			//4. if element is oprator
			else {
				//4.1 pop two elements from the stack
				int op1 = st[top--];
				int op2 = st[top--];
				//4.2 perform operation of op1 and op2
				int res = calculate(op1, element, op2);
				//4.3 push result on stack
				st[++top] = res;
			}
		}
		//5. peek result from stack and return it
		return st[top];
	}

	public static void main(String[] args) {

		String postfix = "456*3/+9+7-";
		
		System.out.println("Postfix : " + postfix);
		int result = evaluatePostfix(postfix);
		System.out.println("Result : " + result);
		
		String prefix = "-++4/*56397";
		System.out.println("Prefix : " + prefix);
		result = evaluatePrefix(prefix);
		System.out.println("Result : " + result);
		
		// String postfix  = "10 200 +";
		//String arr[] = postfix.split(" ");		{"10", "20", "+"}
		
	}

}










