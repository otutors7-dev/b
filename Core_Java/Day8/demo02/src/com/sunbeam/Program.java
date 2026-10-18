package com.sunbeam;

/*
public class Program {
	//Generic method till java 1.4 
	public static void swap(Object x , Object y) {
		Object temp = x; 
		x = y; 
		y = temp; 
		System.out.println("x = " + x + " y = " + y);
	}
	public static void main(String[] args) {
		String s1 = "A"; 
		String s2 = "B"; 
		swap(s1, s2);
		Integer i = 10; 
		Double d = 11.3; 
		swap(i,d); 

	}

}*/ 
public class Program {
	//Generic method till java 1.4 
	public static<T> void swap(T x , T y) {
		T temp = x; 
		x = y; 
		y = temp; 
		System.out.println("x = " + x + " y = " + y);
	}
	public static void main(String[] args) {
		String s1 = "A"; 
		String s2 = "B";  
		swap(s1, s2); // T : String 
		Integer i = 10; 
		Double d = 11.3; 
		//swap(i,d);  // T : Number 
		//Program.<Double>swap(i,d); // Compiler error 
		// Integer will not be converted to Double 
		

	}

}
