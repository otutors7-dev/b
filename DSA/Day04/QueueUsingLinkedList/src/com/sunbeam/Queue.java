package com.sunbeam;

public class Queue {
	private LinkedList list;
	
	public Queue() {
		list = new LinkedList();
	}
	
	public void push(int value) {
		list.addLast(value);
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





