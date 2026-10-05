package com.sunbeam;
class Person{
	String name; 
	int age; 
	public Person() {
		// TODO Auto-generated constructor stub
	}
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public void printRecord( ) {
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
	}
}
class Employee extends Person{
	int empid; 
	double salary; 
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	public Employee(String name, int age, int empid, double salary) {
		super(name,age);
		this.empid = empid;
		this.salary = salary;
	}
	public void displayRecord( ) {
		super.printRecord();
		System.out.println("Empid : " +empid);
		System.out.println("Salary : " + salary);
	}
	
}
public class Program {

	public static void main(String[] args) {
		Person p = new Person("Aditya", 31);  //java.lang.ClassCastException
		Employee e = (Employee) p; //downcasting  
	}
	public static void main5(String[] args) {
		Person p = new Employee("Aditya", 31, 1, 1000.00); //upcasting 
		//System.out.println(p.name);
		//System.out.println(p.age);
		Employee emp = (Employee) p; // downcasting  
		System.out.println(emp.name);
		System.out.println(emp.age);
		System.out.println(emp.empid);
		System.out.println(emp.salary);
		
	}
	public static void main4(String[] args) {
		Employee emp = new Employee("Aditya", 31, 1, 1000.00); 
//		System.out.println(emp.name);
//		System.out.println(emp.age);
//		System.out.println(emp.empid);
//		System.out.println(emp.salary);
		Person p = emp; // upcasting
//		System.out.println(p.name);
//		System.out.println(p.age);
		emp = (Employee) p; // downcasting 
		System.out.println(emp.name);
		System.out.println(emp.age);
		System.out.println(emp.empid);
		System.out.println(emp.salary);

	}
	public static void main3(String[] args) {
		Employee emp = new Employee("Aditya", 31, 1, 1000.00); 
//		System.out.println(emp.name);
//		System.out.println(emp.age);
//		System.out.println(emp.empid);
//		System.out.println(emp.salary);
		Person p = (Person)emp; // upcasting 
		//assigning sub-class reference to super-class reference is upcasting 
		System.out.println(p.name);
		System.out.println(p.age);
		//System.out.println(p.empid);
		//System.out.println(p.salary);
	}
	public static void main2(String[] args) {
		Employee e = new Employee("Rahul", 31, 1, 1000.00); 
		e.displayRecord();
	}
	public static void main1(String[] args) {
		Person p = new Person("Rahul", 31); 
		p.printRecord();
	
	}

}
