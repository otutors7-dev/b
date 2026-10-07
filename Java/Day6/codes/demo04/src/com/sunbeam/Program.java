package com.sunbeam;
//Before object is destroyed, its finalize() 
//method is invoked (if present).

//One should override this method if object holds 
//any resource to be released explicitly 
//e.g. file close, database connection, etc.
class MyClass {
    
    public MyClass() {
    	System.out.println("Resource allocated");
    }
    // ...
    @Override
    public void finalize() {
        System.out.println("Resource closed..");
    }	
}
public class Program {

	public static void main(String[] args) {
		MyClass obj = new MyClass(); 
		obj = null; // Elgible for GC 
		System.gc(); //Request the GC 
		System.out.println("Exit");

	}

}
