import java.util.Scanner;

class Stack{
	private int arr[];
	private int top;
	private final int SIZE;
	
	public Stack(int size) {
		SIZE = size;
		arr = new int[SIZE];
		top = -1;
	}
	
	public void push(int value) {
		// check for full
		if(isFull())
			System.out.println("Stack is full");
		else {
			//1. reposition top
			top++;
			//2. add value at top index
			arr[top] = value;
		}
	}
	
	public int pop() {
		int temp = -1;
		// check for empty
		if(isEmpty())
			System.out.println("Stack is empty");
		else {
			temp = arr[top];
			//1. reposition top
			top--;
		}
		return temp;
	}
	
	public int peek() {
		int temp = -1;
		// check for empty
		if(isEmpty())
			System.out.println("Stack is empty");
		else {
			//1. read value from top index
			temp = arr[top];
		}
		return temp;		
	}
	
	public boolean isEmpty() {
		return top == -1;
	}
	
	public boolean isFull() {
		return top == SIZE - 1;
	}
}

public class StackMain {

	public static void main(String[] args) {
		
		Stack st = new Stack(4);
		
		Scanner sc = new Scanner(System.in);
		int choice;
		
		do {
			System.out.println("0. Exit\n1. Push\n2. Pop\n3. Peek");
			System.out.print("Enter your choice : ");
			choice = sc.nextInt();
			
			switch(choice) {
			case 1:
				System.out.print("Enter value to be added : ");
				int value = sc.nextInt();
				st.push(value);
				break;
			case 2:
				System.out.println("Removed value : " + st.pop());
				break;
			case 3:
				System.out.println("Peeked value : " + st.peek());
				break;
			}
		}while(choice != 0);
		
		
		sc.close();

	}

}
