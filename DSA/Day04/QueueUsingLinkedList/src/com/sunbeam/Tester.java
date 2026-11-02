package com.sunbeam;

public class Tester {

	public static void main(String[] args) {
		
		Queue q = new Queue();
		
		q.push(10);
		q.push(20);
		q.push(30);
		
		System.out.println("Peeked data = " + q.peek());	//10
		
		System.out.println("Poped data = " + q.pop()); 	// 10
		System.out.println("Poped data = " + q.pop()); 	// 20
		
		q.push(40);
		q.push(50);
		
		System.out.println("Peeked data = " + q.peek());	//30
		
		while(!q.isEmpty())
			System.out.println("Poped data = " + q.pop());
		
		// 30 40 50
		
		
		
	}

}
