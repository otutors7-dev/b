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
	
	// setter / mutator 
	//                            10000.00
	public void setSalary(double salary) {
		this.salary = salary; 
	}
	//getter / inspector functions 
	public double getSalary() {
		return salary;
	}
	//facilitator methods 
	public void printRecord() {
		System.out.println("Name : " + this.name);
		System.out.println("Empid : " + this.empid);
		System.out.println("Salary : " + this.salary);
		
	}
}
public class Program {
	public static void main(String[] args) {
		Employee emp = new Employee(); 
		emp.acceptRecord();
		emp.printRecord();
		emp.setSalary(10000.00);
		System.out.println("Updated Salary : " + emp.getSalary());
	}
}
