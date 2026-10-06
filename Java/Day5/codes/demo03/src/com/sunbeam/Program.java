package com.sunbeam;

import java.util.Scanner;

class Shape{
	protected double area; 
	public Shape() {
		// TODO Auto-generated constructor stub
	}
	public void acceptRecord( ) {
		//TODO 
	}
	public void calculateArea( ) {
		//TODO 
	}
	public void printRecord( ) {
		System.out.println("Area : " + area);
	}
}
class Rectangle extends Shape{
	private double length; 
	private double breadth; 
	public Rectangle() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public void acceptRecord() {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Length : ");
		length = sc.nextDouble(); 
		System.out.print("Breadth : ");
		breadth = sc.nextDouble(); 
	}
	@Override
	public void calculateArea() {
		this.area = this.length * this.breadth; 
	}
}
class Circle extends Shape{
	private double radius; 
	public Circle() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public void acceptRecord() {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Radius : ");
		radius = sc.nextDouble(); 
	}
	@Override
	public void calculateArea() {
		this.area = Math.PI * this.radius * this.radius; 
	}
}
public class Program {
	
	public static int menuList( ) {
		Scanner sc = new Scanner(System.in); 
		System.out.println("0.Exit");
		System.out.println("1.Rectangle");
		System.out.println("2.Circle");
		System.out.println("Enter the choice : ");
		int choice = sc.nextInt(); 
		return choice; 
	}
	public static void main(String[] args) {
		int choice; 
		while((choice = menuList())!=0) {
			Shape shape = null; 
			switch (choice) {
			case 1:
				shape = new Rectangle(); // upcasting 
				break;
			case 2: 
				shape = new Circle(); //upcasting 
				break; 
			}
			if(shape!=null) {
				shape.acceptRecord(); //dynamic method dispatch 
				shape.calculateArea();//dynamic method dispatch 
				shape.printRecord();
			}
		}

	}

}
