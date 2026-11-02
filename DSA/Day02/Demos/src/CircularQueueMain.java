import java.util.Scanner;

class CircularQueue{
	private int arr[];
	private int front, rear;
	private final int SIZE;
	
	public CircularQueue(int size) {
		SIZE = size;
		arr = new int[SIZE];
		front = rear = -1;
	}
	
	public void offer(int value) {
		// check for full
		if(isFull())
			System.out.println("Queue is full");
		else {
			//1. repoistion rear (inc)
			rear = (rear + 1) % SIZE;
			//2. add value at rear index
			arr[rear] = value;
		}
	}
	
	public int poll() {
		int temp = -1;
		// check for empty
		if(front == rear && rear == -1)
			System.out.println("Queue is empty");
		else {
			temp = arr[(front + 1) % SIZE];
			//a. reposition front
			front = (front + 1) % SIZE;
			// if queue is becoming empty, move front and rear back to -1
			if(front == rear)
				front = rear = -1;
		}
		return temp;
	}
	
	public int peek() {
		int temp = -1;
		// check for empty
		if(front == rear && rear == -1)
			System.out.println("Queue is empty");
		else {
			//1. read value from front end
			temp = arr[(front + 1) % SIZE];
		}
		return temp;
	}
	
	public boolean isEmpty(){
		return front == rear && rear == -1;
	}
	
	public boolean isFull() {
		return (front == -1 && rear == SIZE - 1) || (front == rear && rear != -1);
	}
	
}




public class CircularQueueMain {

	public static void main(String[] args) {
		
		CircularQueue q = new CircularQueue(4);
		
		Scanner sc = new Scanner(System.in);
		int choice;
		
		do {
			System.out.println("0. Exit\n1. Offer\n2. Poll\n3. Peek");
			System.out.print("Enter your choice : ");
			choice = sc.nextInt();
			
			switch(choice) {
			case 1:
				System.out.print("Enter value to be added : ");
				int value = sc.nextInt();
				q.offer(value);
				break;
			case 2:
				System.out.println("Removed value : " + q.poll());
				break;
			case 3:
				System.out.println("Peeked value : " + q.peek());
				break;
			}
		}while(choice != 0);
		
		
		sc.close();
	}

}













