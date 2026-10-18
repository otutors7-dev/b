class Employee 
{
	private String name;
	private String lname;
	private double salary;
	
	public Employee()
	{
		name = "Saad";
		lname = "Malik";
		salary = 999999;
	}
	public Employee(String name, String lname, double salary)
	{
		this.name=name;
		this.lname=lname;
		setSalary(salary);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) 
	{
		if(salary>0)
		{
			this.salary = salary;
		}
		else
		{
			System.out.println("Salary cannot be zero or negative");
		}
	}
	void printRecord()
	{
		System.out.println("Name : "+name);
		System.out.println("Last Name : "+lname);
		System.out.println("Salary : "+salary);
	}
	void AnnualSalary()
	{
		double annual = salary*12;
		System.out.println("Yearly Salary = " +annual);
	}
	void raiseSalary()
	{
		double r = salary+(salary*0.1);
		double raise = r*12;
		System.out.println("Hiked Salary = " +raise );
	}
}

public class EmployeeTest
{
	public static void main(String[] args)
	{
		Employee e = new Employee();
		e.printRecord();
		
		Employee e1 = new Employee("Raj","Khan",-94684);
		Employee e2 = new Employee("Raj","Gupta",500);
		e1.printRecord();
		e1.AnnualSalary();
		e1.raiseSalary();
		
		e2.printRecord();
		e2.AnnualSalary();
		e2.raiseSalary();
	}
}