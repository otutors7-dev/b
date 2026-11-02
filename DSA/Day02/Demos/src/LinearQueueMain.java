import java.util.Scanner;

class LinearQueue{
	private int arr[];
	private int front, rear;
	private final int SIZE;
	
	public LinearQueue(int size) {
		SIZE = size;
		arr = new int[SIZE];
		front = rear = -1;
	}
	
	public void offer(int value) {
		// check for full
		if(rear == SIZE - 1)
			System.out.println("Queue is full");
		else {
			//1. repoistion rear (inc)
			rear++;
			//2. add value at rear index
			arr[rear] = value;
		}
	}
	
	public int poll() {
		int temp = -1;
		// check for empty
		if(front == rear)
			System.out.println("Queue is empty");
		else {
			temp = arr[front + 1];
			//a. reposition front
			front++;
			// if queue is becoming empty, move front and rear back to -1
			if(front == rear)
				front = rear = -1;
		}
		return temp;
	}
	
	public int peek() {
		int temp = -1;
		// check for empty
		if(front == rear)
			System.out.println("Queue is empty");
		else {
			//1. read value from front end
			temp = arr[front + 1];
		}
		return temp;
	}
	
	public boolean isEmpty(){
		return front == rear;
	}
	
	public boolean isFull() {
		return rear == SIZE - 1;
	}
	
}




public class LinearQueueMain {

	public static void main(String[] args) {
		
		LinearQueue q = new LinearQueue(4);
		
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













