package com.sunbeam;
interface A{
	void f1( ); 
}
interface B{
	void f1( ); 
}
class Test implements A , B{

	@Override
	public void f1() {
		System.out.println("Test.f1()");
	}
	
}
public class Program {

	public static void main(String[] args) {
		A a = new Test( ); 
		a.f1();
		B b = new Test(); 
		b.f1();

	}

}
