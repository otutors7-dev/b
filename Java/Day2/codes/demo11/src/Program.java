import java.util.Scanner;

class Employee {
	// fields
	private String name;
	private int empid;
	private double salary;

	// Methods
	public void setSalary(double salary) {
		this.salary = salary;
	}

	// getter / inspector functions
	public double getSalary() {
		return salary;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

}
//Tester class to Test Employee 
class EmployeeTest {
	Employee emp = new Employee();

	public void acceptRecord() {
		Scanner sc = new Scanner(System.in);
		System.out.print("Name : ");
		String name = sc.next();
		emp.setName(name);

		System.out.print("Empid : ");
		int empid = sc.nextInt();
		emp.setEmpid(empid);

		System.out.print("Salary : ");
		double salary = sc.nextDouble();
		emp.setSalary(salary);
	}

	public void printRecord() {
		System.out.println("Name : " + emp.getName());
		System.out.println("Empid : " + emp.getEmpid());
		System.out.println("Salary : " + emp.getSalary());

	}
}

public class Program {
	public static void main(String[] args) {
		EmployeeTest employeeTest = new EmployeeTest(); 
		employeeTest.acceptRecord();
		employeeTest.printRecord();
	}
}
