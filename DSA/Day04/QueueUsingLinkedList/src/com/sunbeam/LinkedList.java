package com.sunbeam;

public class LinkedList {
	static class Node{
		private int data;
		private Node next;
		private Node prev;
		public Node(int value) {
			data = value;
			next = null;
			prev = null;
		}
	}
	
	private Node head;
	
	public LinkedList() {
		head = null;
	}

	public boolean isEmpty() {
		return head == null;
	}
	
	public void addLast(int value){
		//1. create a newnode
		Node newnode = new Node(value);
		//2. if list is empty
		if(head == null) {
			//a. add newnode into head
			head = newnode;
			//b. make list circular
			newnode.next = newnode.prev = newnode;
		}
		//3. if list is not empty
		else {
			//a. add first node into next of newnode
			newnode.next = head;
			//b. add last node into prev of newnode
			newnode.prev = head.prev;
			//c. add newnode into next of last node
			head.prev.next = newnode;
			//d. add newnode into prev of first node
			head.prev = newnode;
		}
	}
	
	
	public int deleteFirst() {
		//1. if list is empty
		if(head == null)
			return -1;
		int temp = head.data;
		//2. if list has single node
		if(head == head.next)
			head = null;
		//3. if list has multiple node
		else {
			//a. add second node into next of last node
			head.prev.next = head.next;
			//b. add last node into prev of second node
			head.next.prev = head.prev;
			//c. move head on second node
			head = head.next;
		}
		return temp;
	}
	
	public int getFirst() {
		//1. if list is empty
		if(head == null)
			return -1;
		//2. if list is not empty
		return head.data;
	}
		
	
}













