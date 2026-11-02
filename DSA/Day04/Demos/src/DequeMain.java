
class Deque{
	
	static class Node{
		private int data;
		private Node next, prev;
		
		public Node(int value) {
			data = value;
			next = prev = null;
		}
	}
	
	private Node front;		//--> head
	private Node rear;		//--> tail
	private int size;
	
	public Deque() {
		front = rear = null;
		size = 0;
	}
	
	public int size() {
		return size;
	}
	
	public void pushFront(int value) {
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. if deque is empty
		if(isEmpty())
			front = rear = newnode;
		//3. if deque is not empty
		else {
			newnode.next = front;
			front.prev = newnode;
			front = newnode;
		}
		size++;
	}
	
	public int popFront() {
		int val = -1;
		//1. if deque is empty
		if(isEmpty())
			return val;
		//2. if deque has single value
		else if(front == rear){
			val = front.data;
			front = rear = null;
		}
		//3. if deque has multiple values
		else {
			val = front.data;
			front = front.next;
			front.prev = null;
		}
		size--;
		return val;
	}
	
	public int peekFront() {
		int val = -1;
		if(isEmpty())
			System.out.println("Deque is empty");
		else
			val = front.data;
		return val;
	}
	
	public void pushRear(int value) {
		//1. craete a newnode
		Node newnode = new Node(value);
		//2. if deque is empty
		if(isEmpty())
			front = rear = newnode;
		//3. if deque is not empty
		else {
			newnode.prev = rear;
			rear.next = newnode;
			rear = newnode;
		}
		size++;
	}
	
	public int popRear() {
		int val = -1;
		//1. if deque is empty
		if(isEmpty())
			return val;
		//2. if deque has single value
		else if(front == rear){
			val = rear.data;
			front = rear = null;
		}
		//3. if deque has multiple values
		else {
			val = rear.data;
			rear = rear.prev;
			rear.next = null;
		}
		size--;
		return val;		
	}
	
	public int peekRear() {
		int val = -1;
		if(isEmpty())
			System.out.println("Deque is empty");
		else
			val = rear.data;
		return val;
	}
	
	public boolean isEmpty() {
		return front == null && rear == null;
	}
	
}



public class DequeMain {

	public static void main(String[] args) {

		Deque dq = new Deque();
		
		System.out.println("isEmpty : " + dq.isEmpty());		// true
		System.out.println("size : " + dq.size());			// 0
		
		dq.pushFront(10);
		dq.pushFront(20);
		dq.pushRear(30);
		dq.pushRear(40);
		
		// 20 - 10 - 30 - 40
		
		System.out.println("isEmpty : " + dq.isEmpty());		// false
		System.out.println("size : " + dq.size());				// 4
		System.out.println("Peeked from front : " + dq.peekFront());		// 20
		System.out.println("Peeked from rear : " + dq.peekRear());			// 40
		
		while(!dq.isEmpty())
			System.out.println("Poped value : " + dq.popFront());		// 20 10 30 40

	}

}













