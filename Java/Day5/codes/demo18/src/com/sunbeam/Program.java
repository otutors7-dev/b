package com.sunbeam;

public class Program {

	public static void main(String[] args) {
		Shape s = new Rectangle(10.0, 2.0); 
		System.out.println("Area : " + s.calcArea());
		System.out.println("Peri : " + s.calcPeri());
		
		s = new Circle(4.1); 
		System.out.println("Area : " + s.calcArea());
		System.out.println("Peri : " + s.calcPeri());
		
		s = new Square(4.1); 
		
		System.out.println("Area : " + s.calcArea());
		System.out.println("Peri : " + s.calcPeri());
		

	}

}
