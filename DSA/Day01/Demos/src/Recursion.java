
public class Recursion {
	
	// Non tail recursion
	public static int factorial(int n) {
		//1. base / terminating condition
		if(n == 1)
			return 1;
		//2. factorial formula
		return n * factorial(n - 1);
	}

	// Tail recursion
	public static int factorial(int n, int fact) {
		//1. base / terminating condition
		if(n == 1)
			return fact;
		//2. factorial formula
		return factorial(n - 1, fact * n);
	}

	public static void printBinary(int n) {
		if(n == 0)
			return;
		printBinary(n / 2);
		System.out.print(n % 2);
	}

	public static void main(String[] args) {
				
		int num = 5;
		//int fact = factorial(num);
		int fact = factorial(num, 1);
		System.out.println(num + "! = " + fact);
		
		num = 9;
		System.out.print(num + " : ");
		printBinary(num);
		System.out.println();
		
		num = 10;
		System.out.print(num + " : ");
		printBinary(num);
		System.out.println();

	}

}












