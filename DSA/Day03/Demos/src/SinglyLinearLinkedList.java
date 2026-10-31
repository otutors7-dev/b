
class LinkedList{
	static class Node{
		private int data;
		private Node next;
		
		public Node(int value) {
			data = value;
			next = null;
		}
	}
	
	private Node head;
	
	public LinkedList() {
		head = null;
	}
	
	public boolean isEmpty() {
		return head == null;
	}
	
	public void addFirst(int value) {
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. add first node into next of newnode
		newnode.next = head;
		//3. move head on newnode
		head = newnode;
	}
	
	public void addLast(int value) {
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. if list is empty add newnode into head
		if(head == null)
			head = newnode;
		//3. if list is not empty
		else {
			//a. traverse till last node
			Node trav = head;
			while(trav.next != null)
				trav = trav.next;
			//b. add newnode into next of last node
			trav.next = newnode;
		}
	}
	
	public void addPosition(int value, int pos) {
		//0. craete a newnode
		Node newnode = new Node(value);
		//1. if list is empty
		if(head == null)
			head = newnode;
		//special case 1 : pos <= 1
		else if(pos <= 1) {
			newnode.next = head;
			head = newnode;
		}
		//2. if list is not empty
		else {
			//a. traverse till pos - 1 node
			Node trav = head;
										   // special case 2 : pos > size + 1
			for(int i = 1 ; i < pos - 1 && trav.next != null; i++)
				trav = trav.next;
			//b. add pos node into next of newnode
			newnode.next = trav.next;
			//c. add newnode into next of pos -1 node
			trav.next = newnode;
		}
	}
	
	public void deleteFirst() {
		//1. if list is empty return
		if(head == null)
			return;
		//2. if list is not empty, move head on second node
		head = head.next;		
	}
	
	public void deleteLast() {
		//1. if list is empty, return
		if(head == null)
			return;
		//2. if list has single node, delete it
		else if(head.next == null)
			head = null;
		//3. if list has multiple nodes
		else {
			//a. traverse till second last node
			Node trav = head;
			while(trav.next.next != null)
				trav = trav.next;
			//b. add null into next of second last node
			trav.next = null;
		}
	}
	
	public void deletePosition(int pos) {
		//1. if list is empty or position is invalid return
		if(head == null || pos < 1)
			return;
		// special condition : pos = 1
		else if(pos == 1) {
			head = head.next;
		}
		//2. if list is not empty
		else {
			//a. traverse till pos - 1 node
			Node trav = head;
			for(int i = 1 ; i < pos - 1 ; i++) {
				trav = trav.next;
				// if position is invalid pos > size
				if(trav.next == null)
					return;
			}
			//b. add pos + 1 node into next of pos - 1 node
			trav.next = trav.next.next;
		}
	}
	
	public void display() {
		//1. create trav and start at first node
		Node trav = head;
		System.out.print("List :: ");
		while(trav != null) {
			//2. print current node
			System.out.print(" " + trav.data);
			//3. go on next node
			trav = trav.next;
		}//4. repeat till last node
		System.out.println();
	}
	
	public void deleteAll() {
		head = null;
	}
	
}



public class SinglyLinearLinkedList {

	public static void main(String[] args) {

		LinkedList list = new LinkedList();
		
		list.addFirst(40);
		list.addFirst(30);
		list.addFirst(20);
		list.addFirst(10);
		
//		list.addLast(50);
//		list.addLast(60);
//		
//		list.deleteFirst();
//		list.deleteLast();
		
		//list.addPosition(100, 4);
		//list.addPosition(100, 1);
		//list.addPosition(100, -1);
		//list.addPosition(100, 5);
		//list.addPosition(100, 6);
		//list.addPosition(100, 100); 
		
		
		//list.deletePosition(3);
		//list.deletePosition(1);
		//list.deletePosition(0);
		list.deletePosition(4);
		//list.deletePosition(5);
		
		list.display();

	}

}

















