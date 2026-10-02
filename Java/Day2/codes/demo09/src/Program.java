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
		this.name = sc.next(); 
		System.out.print("Empid : ");
		this.empid = sc.nextInt(); 
		System.out.print("Salary : ");
		this.salary = sc.nextDouble(); 
	}
	public void printRecord() {
		System.out.println("Name : " + this.name);
		System.out.println("Empid : " + this.empid);
		System.out.println("Salary : " + this.salary);
		
	}
}
public class Program {

	public static void main(String[] args) {
		Employee emp1 = new Employee(); 
		Employee emp2 = new Employee(); 
		Employee emp3 = new Employee(); 
		//emp1 , emp2 , emp3 --- references ( allocated on stack) 
		// new Employee() -- allocated on heap 
		emp1.acceptRecord();
		emp1.printRecord();
	}
	public static void main1(String[] args) {
		Employee emp = new Employee(); 
		//emp : reference 
		// new Employee : Instance 
		emp.acceptRecord();
		emp.printRecord();
		

	}

}
