package com.sunbeam;
class Person{
	//TODO 
}
class Employee extends Person{
	//TODO 
}
class Manager extends Employee{
	//TODO
}
public class Program {

	public static void main(String[] args) {
		
		
		/*
		Person p = new Manager(); 
		boolean flag = p instanceof Employee ;  // Employee or Subclass of employee
		System.out.println(flag); // True
	 	*/ 
		
		/*
		Person p = new Person();
	    boolean flag = p instanceof Employee; // false
	    System.out.println(flag);
		*/  
		
		/* 
		Person p = new Person();
	    boolean flag = p instanceof Person; // True 
	    System.out.println(flag);
		*/ 
		
		/*
		Person p = new Manager(); 
		boolean flag = p instanceof Manager; //Manager or Subclass of Manager 
		System.out.println(flag); // True 
		*/
		
		/*
		Person p = new Manager(); 
		boolean flag = p instanceof Employee; //Employee or subclass of Employee
		System.out.println(flag); // True 
		*/ 
		
		/*
		Person p = new Manager(); 
		boolean flag = p instanceof Person; 
		System.out.println(flag); // True 
		*/ 
		
		/* 
		Person p = new Person(); 
		boolean flag = p instanceof Manager; //Manager or Subclass OF Manager
		System.out.println(flag); // False  
		*/   
			
		/*
		Employee e = new Manager();  
		boolean flag = e instanceof Employee; 
		System.out.println(flag); // True  
		*/ 
			
		/*
		Person p = new Person();  
		boolean flag = p instanceof Employee; 
		System.out.println(flag); // False 
		*/   
		
		/*
		Employee p = new Employee();  
		boolean flag = p instanceof Manager; 
		System.out.println(flag); // False 
		*/   
			
		/*
		Employee p = new Employee();  
		boolean flag = p instanceof Person; 
		System.out.println(flag); // True
		*/  
		
		/*
		Employee p = new Employee();  
		boolean flag = p instanceof Object; 
		System.out.println(flag); // True 
		*/ 
	}

}
