package com.sunbeam;

public class Tester {

	public static void main(String[] args) {
		
		Stack st = new Stack();
		
		st.push(10);
		st.push(20);
		st.push(30);
		
		System.out.println("Peeked data = " + st.peek());	//30
		
		System.out.println("Poped data = " + st.pop()); 	// 30
		System.out.println("Poped data = " + st.pop()); 	// 20
		
		st.push(40);
		st.push(50);
		
		System.out.println("Peeked data = " + st.peek());	//50
		
		while(!st.isEmpty())
			System.out.println("Poped data = " + st.pop());
		
		// 50 40 10
		
		
		
	}

}
