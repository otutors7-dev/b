package com.sunbeam;
class MyClass{
	private int num1 = 10; //field init 
	private int num2 = 20; //field init
	private int num3;
	private int num4;
	
	{
		System.out.println("Initializer block -- 1");
		num3 = 30; // object / instance init --- java 5.0 
	}
	{
		System.out.println("Initializer block -- 2");
		num4 = 40; // object / instance init --- java 5.0 
	}
	{
		System.out.println("Initializer block -- 3");
	}
	public MyClass() {
		System.out.println("ctor");
		num1 = 100; //Constructor
		num2 = 200; 
	}
	public void display( ) {
		System.out.printf("num1 : %d num2 : %d num3 : %d num4 : %d",num1,num2,num3,num4);
	}
}
public class Program {

	public static void main(String[] args) {
		MyClass obj = new MyClass(); 
		obj.display();

	}

}
