package com.sunbeam;
class Employee{
	private int empid; 
	private String name; 
	private double salary; 
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	public Employee(int empid, String name, double salary) {
		this.empid = empid;
		this.name = name;
		this.salary = salary;
	}
	public void display( ) {
		System.out.printf("Empid : %d Name : %s Salary : %.2f\n",empid,name,salary);
	}
	
}
public class Program {

	public static Employee[] getInstances( ) {
		Employee[] arr = new Employee[3]; 
		arr[0] = new Employee(3, "Rahul", 1000.00);
		arr[1] = new Employee(1, "Sagar", 2000.00);
		arr[2] = new Employee(2, "Prashant", 3000.00);
		return arr; 
	}
	public static void printEmployees(Employee[] ar) {
		for(Employee e : ar) {
			e.display();
		}
	}
	public static void main(String[] args) {
		Employee[] a = Program.getInstances(); 
		Program.printEmployees(a);
	}
	public static void main3(String[] args) {
		Employee[] arr = new Employee[] { new Employee(3, "Adtiya", 1000.00), new Employee(2, "Rahul", 2000.00)}; 
		for(int i = 0 ; i < arr.length ; i++) {
			arr[i].display();
		}
	}
	public static void main2(String[] args) {
		Employee[] arr = null; 
		arr = new Employee[3]; 
		arr[0] = new Employee(3, "Aditya", 1000.00);
		arr[1] = new Employee(1, "Ketan", 3000.00);
		arr[2] = new Employee(2, "Sagar", 2000.00);
		for(Employee e : arr)
			e.display();
		
	}
	public static void main1(String[] args) {
		Employee[] arr = null; 
		arr = new Employee[3]; 
		System.out.println(arr[0]); // null 
		System.out.println(arr[1]); // null
		System.out.println(arr[2]); // null 
		
		//arr[0].display(); // java.lang.NullPointerException

	}

}
