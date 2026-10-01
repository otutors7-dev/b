import java.util.Scanner;

public class Program {

	public static void main1(String[] args) {
		Scanner sc = new Scanner(System.in);  
		//Student : I/p a roll  , name , marks 
		
		System.out.print("Enter the name : ");
		String name = sc.next(); // Nilesh 
		
		System.out.print("Enter the roll : ");
		int roll = sc.nextInt(); // 10 
		
		System.out.print("Enter the marks : ");
		double marks =  sc.nextDouble(); 
		
		System.out.println("Name : "+name);
		System.out.println("Roll : "+ roll);
		System.out.println("Marks : "+marks);
	}
	public static void main2(String[] args) {
		Scanner sc = new Scanner(System.in);  
		//Student : I/p a roll  , name , marks 
		
		System.out.print("Enter the name : ");
		String name = sc.nextLine(); //read upto \n 
		
		System.out.print("Enter the roll : ");
		int roll = sc.nextInt(); // 10 
		
		System.out.print("Enter the marks : ");
		double marks =  sc.nextDouble(); 
		
		System.out.println("Name : "+name);
		System.out.println("Roll : "+ roll);
		System.out.println("Marks : "+marks);
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);  
		//Student : I/p a roll  , name , marks 
		
		System.out.print("Enter the roll : ");
		int roll = sc.nextInt(); // 10 + \n
		
		sc.nextLine(); 
		
		System.out.print("Enter the name : ");
		String name = sc.nextLine(); //read upto \n 
		
		
		System.out.print("Enter the marks : ");
		double marks =  sc.nextDouble(); 
		
		
		System.out.println("Name : "+name);
		System.out.println("Roll : "+ roll);
		System.out.println("Marks : "+marks);
	}

}
