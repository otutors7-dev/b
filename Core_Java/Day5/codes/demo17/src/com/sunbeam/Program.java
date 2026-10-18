package com.sunbeam;
abstract class A{
	public final void f1( ) { // implementation 100% complete  
		System.out.println("A.f1()");
	}
	public abstract void f2( );  // implementation 100% Incomplete
		
	
	public void f3( ) { // partially complete 
		System.out.println("A.f3()");
	}
}
class B extends A{
	@Override
	public void f2() { // partially complete 
		System.out.println("B.f2");
	}
	@Override
	public final void f3() { // impl 100% complete 
		System.out.println("B.f3()");
	}
}
final class C extends B{
	@Override
	public final void f2() { // impl 100% complete
		System.out.println("C.f2()");
	}
}
public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
