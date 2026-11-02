import java.util.Stack;

public class ParenthesisBalancingMain {
	
	public static boolean isParenthesisBalanced(String expr)
	{
		String opening = "({[";
		String closing = ")}]";
		Stack<Character> st = new Stack<Character>();
		
		//1. traverse from left to right
		for(int i = 0 ; i < expr.length() ; i++) {
			//2. extract element of ith index
			char element = expr.charAt(i);
			//3. if element is opening
			if(opening.indexOf(element) != -1)
				st.push(element);
			//4. if element is closing
			else {
				//4.1 if stack is empty, return
				if(st.isEmpty())
					return false;
				//4.2 if stack is not empty, pop and compare with current element
				int indexOfOpening = opening.indexOf(st.pop());
				int indexOfClosing = closing.indexOf(element);
				//4.3 if not matching with each other
				if(indexOfClosing != indexOfOpening)
					return false;
			}
		}
		//5. if openings are remained on stack
		if(!st.isEmpty())
			return false;
		
		return true;
	}

	public static void main(String[] args) {

		String expr = "([]({}])";
		
		boolean ret =  isParenthesisBalanced(expr);
		if(ret)
			System.out.println("Parenthesis are balanced");
		else
			System.out.println("Parenthesis are not balanced");
	}

}
