package com.sunbeam;
interface Printable{
	void f1( );
	void f2( );
	void f3( );
}
abstract class Test implements Printable{

	@Override
	public void f1() {	}

	@Override
	public void f2() {	}

	@Override
	public void f3() {  }
	
}
class A extends Test{
	@Override
	public void f1() {
		System.out.println("A.f1()");
	}
}
class B extends Test{
	@Override
	public void f2() {
		System.out.println("B.f2()");
	}
}
class C extends Test{
	@Override
	public void f3() {
		System.out.println("C.f3()");
	}
}
public class Program {

	public static void main(String[] args) {
		Printable p = new A(); 
		p.f1();
		p = new B(); 
		p.f2();
		p = new C(); 
		p.f3();

	}

}
