package com.sunbeam;
class Person{
	private String name; 
	private int age; 
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
class Employee{
	private String name; 
	private int age; 
	private int empid; 
	private double salary; 
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	public Employee(String name, int age, int empid, double salary) {
		this.name = name;
		this.age = age;
		this.empid = empid;
		this.salary = salary;
	}
	public void displayRecord( ) {
		System.out.println("Name: " + name);
		System.out.println("Age : " + age);
		System.out.println("Empid : " +empid);
		System.out.println("Salary : " + salary);
	}
	
}
public class Program {

	public static void main(String[] args) {
		Employee e = new Employee("Rahul", 31, 1, 1000.00); 
		e.displayRecord();
	}
	public static void main1(String[] args) {
		Person p = new Person("Rahul", 31); 
		p.printRecord();
	
	}

}
