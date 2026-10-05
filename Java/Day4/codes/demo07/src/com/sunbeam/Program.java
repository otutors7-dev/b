package com.sunbeam;
class Singleton{
	//step 1: Write a class with desired fields and methods.
	//step 3: Add a private static field to hold instance of the class.
	private static Singleton obj; 
	
	//step 4: Initialize the field to single object using 
    //static field initializer or static block.
	static {
		obj = new Singleton(); 
	}
	//step 2: Make constructor(s) private.
	private Singleton() {
		// TODO Auto-generated constructor stub
	}
	//step 5: Add a public static method to return the object.
	public static Singleton getInstance( ) {
		return obj; 
	}
}
public class Program {

	public static void main(String[] args) {
		Singleton s1 = Singleton.getInstance(); 
		Singleton s2 = Singleton.getInstance(); 
		if(s1 == s2)
			System.out.println("Same");
		else 
			System.out.println("not same");
	}

}
