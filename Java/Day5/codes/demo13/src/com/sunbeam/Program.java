package com.sunbeam;


//If two interfaces have same method, 
//then it is implemented only once in sub-class.

interface A{
	/*public abstract*/void f1( );
	/*public abstract*/void f2( ); 
}
interface B{
	/*public abstract*/void f1( ); 
}
class Test implements A , B{

	@Override
	public void f1() {
		System.out.println("Test.f1()");
	}

	@Override
	public void f2() {
		System.out.println("Test.f2()");
	}
	
}
public class Program {

	public static void main(String[] args) {
		A a = new Test(); 
//		a.f1();
//		a.f2();
		B b = new Test(); 
		b.f1();

	}

}
