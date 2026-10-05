package com.sunbeam;
import static com.sunbeam.Chair.setPrice;
import static com.sunbeam.Chair.getPrice; 
import static java.lang.Math.*; 
//To access static members of a class in the 
//same class, the "ClassName." is optional.

//To access static members of another class, the "ClassName." is mandetory.
//If need to access static members of other class frequently, 
//use "import static" so that we can access 
//static members of other class direcly (without ClassName.).

public class Program {
	static int number = 100;
	public static double calcArea(double rad) {
		//return Math.PI * rad * rad;
		return PI * rad * rad;
	}
	public static void main(String[] args) {
		//static int number = 100; 
		Chair c1 = new Chair(10, 20);
		c1.display();
		//Chair.setPrice(1000);
		setPrice(1000);
		
		//System.out.println("Updated Price : " + Chair.getPrice());
		
		//System.out.println("Updated Price : " + getPrice());
	
		
		//double area = Program.calcArea(3.1);
		double area = calcArea(3.1);
		System.out.println("Area : " + area);
	}

}
