package com.sunbeam;

public class Stack {
	private LinkedList list;
	
	public Stack() {
		list = new LinkedList();
	}
	
	public void push(int value) {
		list.addFirst(value);
	}
	
	public int pop() {
		return list.deleteFirst();
	}
	
	public int peek() {
		return list.getFirst();
	}
	
	public boolean isEmpty() {
		return list.isEmpty();
	}
}





