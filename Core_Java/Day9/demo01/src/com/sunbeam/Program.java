package com.sunbeam;

import java.util.Arrays;
import java.util.Comparator;

class Person{
	private String name; 
	public Person() {
		// TODO Auto-generated constructor stub
	}
	public Person(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return String.format("%-20s",name); 
	}
}
class Employee extends Person{
	private int empid; 
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	public int getEmpid() {
		return empid;
	}
	public Employee(String name , int empid) {
		super(name); 
		this.empid = empid;
	}
	@Override
	public String toString() {
		return String.format("%-20s%-15d",super.toString(),empid); 
	}
}
class Student extends Person{
	private int roll; 
	public Student() {
		// TODO Auto-generated constructor stub
	}
	public int getRoll() {
		return roll;
	}
	public Student(String name , int roll) {
		super(name); 
		this.roll = roll;
	}
	@Override
	public String toString() {
		return String.format("%-20s%-15d",super.toString(),roll); 
	}
	
}
class SortByName implements Comparator<Person>{

	@Override
	public int compare(Person x, Person y) {
		int diff = x.getName().compareTo(y.getName()); 
		return diff; 
	}
	
}
class SortById implements Comparator<Person>{

	@Override
	public int compare(Person p1, Person p2) {
		if(p1 instanceof Employee && p2 instanceof Employee) {
			Employee e1 = (Employee) p1;
			Employee e2 = (Employee) p2;
			return e1.getEmpid() - e2.getEmpid(); 
		}
		else if(p1 instanceof Student && p2 instanceof Student) {
			Student s1 = (Student) p1;
			Student s2 = (Student) p2;
			return s1.getRoll() - s2.getRoll(); 
		}
		else if(p1 instanceof Employee && p2 instanceof Student) {
			Employee e1 = (Employee) p1;
			Student s1 = (Student) p2;
			return e1.getEmpid() - s1.getRoll(); 
		}
		else {
			Student s1 = (Student) p1;
			Employee e1 = (Employee) p2;
			return s1.getRoll() - e1.getEmpid(); 
		}
	}
	
}
public class Program {
	public static Person[] getInstances( ) {
		Person[] arr = new Person[4]; 
		arr[0] = new Employee("Aditya", 3);
		arr[1] = new Student("Pratik", 1); 
		arr[2] = new Employee("Rahul", 4);
		arr[3] = new Student("Sagar", 2); 
		return arr; 
	}
	public static void print(Person[] arr) {
		for(int i = 0 ; i < arr.length ; i++) {
			System.out.println(arr[i]);
		}
	}
	public static void main(String[] args) {
		Person[] arr = Program.getInstances();  
		//Arrays.sort(arr, new SortByName());
		Arrays.sort(arr, new SortById());
		Program.print(arr);
	}

}



