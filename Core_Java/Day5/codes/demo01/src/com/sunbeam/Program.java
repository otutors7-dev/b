package com.sunbeam;


//Programmer should override a method in sub-class in one of the following scenarios

//1.Super-class has not provided method/function implementation at all (abstract method).

//2.Super-class has provided partial method/function implementation and sub-class 
//needs additional code. 

//3.Sub-class needs different implementation than that of super-class 
//method implementation.


class SuperClass {
   private Number calculate(Integer i, Float f) {
        // ...
    	return 100; 
    }
}
class SubClass extends SuperClass {
	
	public Number calculate(Integer i, Float f) {
        // ...
    	return 100; 
    }
}
public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
