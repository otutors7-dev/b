import java.util.Scanner;

class Employee{
	//fields  
	private String name; 
	private int empid; 
	private double salary;
	
	//methods 
	public void acceptRecord() {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Name : ");
		name = sc.next(); 
		System.out.print("Empid : ");
		empid = sc.nextInt(); 
		System.out.print("Salary : ");
		salary = sc.nextDouble(); 
	}
	public void printRecord() {
		System.out.println("Name : " + name);
		System.out.println("Empid : " + empid);
		System.out.println("Salary : " + salary);
	}
}
public class Program {

	public static void main(String[] args) {
		Employee emp1 = new Employee(); 
		Employee emp2 = new Employee(); 
		Employee emp3 = new Employee(); 
		//emp1 , emp2 , emp3 --- references ( allocated on stack) 
		// new Employee() -- allocated on heap 
	}
	public static void main1(String[] args) {
		Employee emp = new Employee(); 
		//emp : reference 
		// new Employee : Instance 
		emp.acceptRecord();
		emp.printRecord();
		

	}

}
