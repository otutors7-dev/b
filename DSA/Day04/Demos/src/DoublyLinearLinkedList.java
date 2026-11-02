
class DLLinkedList{
	static class Node{
		private int data;
		private Node next;
		private Node prev;
		
		public Node(int value) {
			data = value;
			next = prev = null;
		}
	}
	
	private Node head, tail;
	private int size;
	
	public DLLinkedList() {
		head = tail = null;
		size = 0;
	}
	
	public boolean isEmpty() {
		//return head == null;
		//return head == null && tail == null;
		return size == 0;
	}
	
	public int size() {
		return size;
	}
	
	public void forwardDisplay() {
		Node trav = head;
		System.out.print("Forward Display : ");
		while(trav != null) {
			System.out.print(" " + trav.data);
			trav = trav.next;
		}
		System.out.println();
	}
	
	public void backwardDisplay() {
		Node trav = tail;
		System.out.print("Backward Display : ");
		while(trav != null) {
			System.out.print(" " + trav.data);
			trav = trav.prev;
		}
		System.out.println();
	}
	
	public void addFirst(int value) {
		//1. create a newnode
		Node newnode = new Node(value);
		//2. if list is empty, add newnode into head and tail
		if(head == null)
			head = tail = newnode;
		//3. if list is not empty
		else {
			//a. add first node into next of newnode
			newnode.next = head;
			//b. add newnode into prev of first node
			head.prev = newnode;
			//c. move head on newnode
			head = newnode;
		}
		size++;
	}
	
	public void addLast(int value) {
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. if list is empty
		if(head == null)
			head = tail = newnode;
		//3. if list is not empty
		else {
			//a. add last node into prev of newnode
			newnode.prev = tail;
			//b. add newnode into next of last node
			tail.next = newnode;
			//c. move tail on newnode 
			tail = newnode;
		}
		size++;
	}
	
	public void addPosition(int value, int pos) {
		// check for invalid position pos < 1 or pos > size + 1
		if(pos < 1 || pos > size + 1) {
			System.out.println("Invalid position");
			return;
		}
		
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. if list is empty
		if(head == null)
			head = tail = newnode;
		// special condition
		else if(pos == 1) {
			newnode.next = head;
			head.prev = newnode;
			head = newnode;
		}
		// special condition
		else if(pos == size + 1) {
			newnode.prev = tail;
			tail.next = newnode;
			tail = newnode;
		}
		//3. if list is not empty
		else {
			//a. traverse till pos - 1 node
			Node trav = head;
			for(int i = 1 ; i < pos - 1 ; i++)
				trav = trav.next;
			//b. add pos node into next of newnode
			newnode.next = trav.next;
			//c. add pos -1 node into prev of newnode
			newnode.prev = trav;
			//d. add newnode into prev of pos node
			trav.next.prev = newnode;
			//e. add newnode into next of pos - 1 node
			trav.next = newnode;
		}
		size++;
	}
	
	public void deleteFirst() {
		//1. if list is empty
		if(head == null)
			return;
		//2. if list has single node
		else if(head == tail)
			head = tail = null;
		//3. if list has multiple nodes
		else {
			//a. move head on second node
			head = head.next;
			//b. make prev of second node null
			head.prev = null;
		}
		size--;
	}
	
	public void deleteLast() {
		//1. if list is empty
		if(head == null)
			return;
		//2. if list has single node
		else if(head == tail)
			head = tail = null;
		//3. if list has multiple nodes
		else {
			//a. move tail on second last node
			tail = tail.prev;
			//b. make next of second last node null
			tail.next = null;
		}
		size--;
	}
	
	public void deletePosition(int pos) {
		// check for invalid positions : pos < 1 or pos > size
		if(pos < 1 || pos > size) {
			System.out.println("Invalid Position");
			return;
		}		
		//1. if list is empty, return
		if(head == null)
			return;
		//2. if list has single node
		else if(head == tail)
			head = tail = null;
		// special case 
		else if(pos == 1) {
			head = head.next;
			head.prev = null;
		}
		// special case
		else if(pos == size) {
			tail = tail.prev;
			tail.next = null;
		}
		//3. if list has multiple nodes
		else {
			//a. traverse till pos node
			Node trav = head;
			for(int i = 1 ; i < pos ; i++)
				trav = trav.next;
			//b. add pos + 1 node into next of pos - 1 node
			trav.prev.next = trav.next;
			//c. add pos - 1 node into prev of pos + 1 node
			trav.next.prev = trav.prev;
		}
		size--;
	}
	
	public void deleteAll() {
		head = tail = null;
		size = 0;
	}
}



public class DoublyLinearLinkedList {

	public static void main(String[] args) {


		DLLinkedList l1 = new DLLinkedList();
		
		l1.addFirst(30);
		l1.addFirst(20);
		l1.addFirst(10);
		
		l1.addLast(40);
		//l1.addLast(50);
		
		//l1.addPosition(100, 3);
		//l1.addPosition(100, 1);
		//l1.addPosition(100, 5);
		//l1.addPosition(100, -1);
		//l1.addPosition(100, 6);
		
		//l1.deleteFirst();
		//l1.deleteLast();
		
		//l1.deletePosition(3);
		//l1.deletePosition(1);
		//l1.deletePosition(4);
		//l1.deletePosition(-2);
		l1.deletePosition(8);
		
		l1.forwardDisplay();
		l1.backwardDisplay();
		System.out.println("size = " + l1.size());

	}

}






















