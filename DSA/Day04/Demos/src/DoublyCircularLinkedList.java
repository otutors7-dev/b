
class DCLinkedList{
	static class Node{
		private int data;
		private Node next;
		private Node prev;
		
		public Node(int value) {
			data = value;
			next = prev = null;
		}
	}
	
	private Node head;
	
	public DCLinkedList() {
		head = null;
	}
	
	public boolean isEmpty() {
		return head == null;
	}
	
	public void fDisplay() {
		//1. if list is empty return
		if(head == null)
			return;
		System.out.print("Forward List : ");
		//2. if list is not empty
		Node trav = head;
		do {
			System.out.print(" " + trav.data);
			trav = trav.next;
		}while(trav != head);
		System.out.println();
	}
	
	public void rDisplay() {
		//1. if list is empty return
		if(head == null)
			return;
		System.out.print("Forward List : ");
		//2. if list is not empty
		Node trav = head.prev;
		do {
			System.out.print(" " + trav.data);
			trav = trav.prev;
		}while(trav != head.prev);
		System.out.println();
	}
	
	public void addFirst(int value) {
		//1. create aa newnode
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
			//e. move head on newnode
			head = newnode;
		}
	}
	
	public void addLast(int value) {
		//1. create aa newnode
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
	
	public void deleteFirst() {
		//1. if list is empty
		if(head == null)
			return;
		//2. if list has single node
		else if(head.next == head)
			head = null;
		//3. if list has multiple nodes
		else {
			//a. add last node into prev of second node
			head.next.prev = head.prev;
			//b. add second node into next of last node
			head.prev.next = head.next;
			//c. move head on second node
			head = head.next;
		}
	}
	
	public void deleteLast() {
		//1. if list is empty
		if(head == null)
			return;
		//2. if list has single node
		else if(head.next == head)
			head = null;
		//3. if list has multiple nodes
		else {
			//a. add first node into next of second last node
			head.prev.prev.next = head;
			//b. add second last node into prev of first node
			head.prev = head.prev.prev;
		}
	}
	
	public void deleteAll() {
		head = null;
	}
}

public class DoublyCircularLinkedList {

	public static void main(String[] args) {

		DCLinkedList l1 = new DCLinkedList();
		
		l1.addFirst(20);
		l1.addFirst(10);
		
		l1.addLast(30);
		l1.addLast(40);
		
		l1.deleteFirst();
		l1.deleteLast();
		
		
		l1.fDisplay();
		l1.rDisplay();

	}

}


















