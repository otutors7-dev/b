package com.sunbeam;
//If implementation of a super-class method is logically complete, 
//then the method should be declared as final.

//Such final methods cannot be overridden in sub-class. Compiler raise error, if overridden.

//But final methods are inherited into sub-class i.e. The super-class final 
//methods can be invoked in sub-class object (if accessible).

class Parent{
	public final void display( ) {
		System.out.println("Parent.display()");
	}
}
class Child extends Parent{
	
	/*
	@Override
	public void display() {
		
	}*/
}
public class Program {

	public static void main(String[] args) {
		//Parent p = new Parent(); 
		//p.display();
		
		Child c = new Child(); 
		c.display();
	}

}
