package com.sunbeam;

//Interfaces are used to define standards/specifications. 
//A standard/specification is set of rules.
interface Printable{
	/*public static final*/int number = 10;  
	/*public abstract*/void print( ); 
}
//Service Provider 
class Test implements Printable{

	@Override
	public void print() {
		System.out.println("Number : " + number);
	}
}
public class Program {

	public static void main(String[] args) {
		//Test t = new Test(); 
		//t.print();
		Printable p = new Test(); //upcasting 
		p.print();
	}

}
