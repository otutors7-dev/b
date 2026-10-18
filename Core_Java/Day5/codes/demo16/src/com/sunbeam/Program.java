package com.sunbeam;
abstract class A{
	private int num1; 
	private int num2; 
	public A() {
		// TODO Auto-generated constructor stub
	}
	public A(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
	}
	public void print( ) {
		System.out.println("num1 : " + num1);
		System.out.println("num2 : " + num2);
	}
}
class B extends A{
	public B(int num1 , int num2) {
		super(num1,num2); 
	}
	public void print( ) {
		super.print();
	}
}
public class Program {

	public static void main(String[] args) {
		A obj = new B(10, 20); 
		obj.print();
	}

}
