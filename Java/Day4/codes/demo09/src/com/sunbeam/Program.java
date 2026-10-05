package com.sunbeam;

public class Program {

	public static void main(String[] args) {
		//Person p = new Person(); 
		//p.display();
		
		//Person p2 = new Person("Aditya", 31); 
		//p2.display();
		
		//Student s = new Student(); 
		//s.display();
		
		Student s2 = new Student("Aditya", 31, 1, "MCA", 88); 
		//s2.display();
		System.out.println("Name : " + s2.getName());
		System.out.println("Age : " + s2.getAge());
		System.out.println("Roll : " + s2.getRoll());
		System.out.println("Marks : " + s2.getMarks());
	}

}
