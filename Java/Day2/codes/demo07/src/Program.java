import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		int num1 , num2 , res; 
		String op; 
		System.out.print("num1 : ");
		num1 = sc.nextInt(); 
		System.out.print("num2 : ");
		num2 = sc.nextInt();
		do {
			System.out.print("Enter + , - , * , / or . to exit ");
			op = sc.next(); 
			switch (op) {
			case "+":
				res = num1 + num2; 
				System.out.println("Res : " + res);
				break;
			case "-":
				res = num1 - num2; 
				System.out.println("Res : " + res);
				break;
			case "*":
				res = num1 * num2; 
				System.out.println("Res : " + res);
				break;
			case "/":
				res = num1 / num2; 
				System.out.println("Res : " + res);
				break;
			default:
				System.out.println("Invalid choice");
				break;
			}
			
			
		} while (!op.equals("."));
	}
	
	public static void main1(String[] args) 
	{
		String course = "DAC"; 
		switch (course) {
		case "DAC":
			System.out.println("DAC course");
			break;
		case "DMC": 
			System.out.println("DMC course");
		default:
			break;
		}
	}
}
