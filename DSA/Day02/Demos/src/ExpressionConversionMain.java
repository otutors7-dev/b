import java.util.Stack;

public class ExpressionConversionMain {
	public static int priority(char opr) {
		switch(opr) {
		case '$':	return 10;
		case '*':	return 9;
		case '/':	return 9;
		case '%':	return 9;
		case '+':	return 8;
		case '-':	return 8;
		}
		return 0;
	}
	
	public static String infixToPostfix(String infix) {
		//0. create stack to push operators
		Stack<Character> st = new Stack<Character>();
		//0. create empty string for postfix expression
		StringBuilder postfix = new StringBuilder();
		//1. traverse from left to right
		for(int i = 0 ; i < infix.length() ; i++) {
			//2. extract element of ith index
			char element = infix.charAt(i);
			//3. if element is operand, append it into expression
			if(Character.isDigit(element))
				postfix.append(element);
			//4. if element is '(', push it on stack
			else if(element == '(')
				st.push(element);
			//5. if element is ')'
			else if(element == ')') {
				while(st.peek() != '(')
					postfix.append(st.pop());
				
				st.pop();		// to discard '(' and ')'
			}
			//6. if element is operator
			else {
				//6.1 check priorities
				while(!st.isEmpty() && priority(st.peek()) >= priority(element)) {
					postfix.append(st.pop());
				}
				//6.2 push current operator
				st.push(element);
			}
		}
		//7. pop and append all remaining operators from the stack
		while(!st.isEmpty())
			postfix.append(st.pop());
		//8. return postfix expr
		return postfix.toString();
	}
	
	public static String infixToPrefix(String infix) {
		//0. create stack to push operators
		Stack<Character> st = new Stack<Character>();
		//0. create empty string for prefix expression
		StringBuilder prefix = new StringBuilder();
		//1. traverse from right to left
		for(int i = infix.length() -1 ; i >= 0 ; i--) {
			//2. extract element of ith index
			char element = infix.charAt(i);
			//3. if element is operand, append it into expression
			if(Character.isDigit(element))
				prefix.append(element);
			//4. if element is '(', push it on stack
			else if(element == ')')
				st.push(element);
			//5. if element is '('
			else if(element == '(') {
				while(st.peek() != ')')
					prefix.append(st.pop());
				
				st.pop();		// to discard '(' and ')'
			}
			//6. if element is operator
			else {
				//6.1 check priorities
				while(!st.isEmpty() && priority(st.peek()) > priority(element)) {
					prefix.append(st.pop());
				}
				//6.2 push current operator
				st.push(element);
			}
		}
		//7. pop and append all remaining operators from the stack
		while(!st.isEmpty())
			prefix.append(st.pop());
		
		// reverse the expr
		prefix.reverse();
		
		//8. return prefix expr
		return prefix.toString();
	}

	public static void main(String[] args) {

		String infix = "1$9+3*4-(6+8/2)+7";
		
		System.out.println("Infix : " + infix);
		
		String postfix = infixToPostfix(infix);
		System.out.println("Postfix : " + postfix);

		String prefix = infixToPrefix(infix);
		System.out.println("Prefix : " + prefix);
	}

}






