package com.sunbeam;
class Box<T>{
	private T obj; 
	public void set(T obj) {
		this.obj = obj; 
	}
	public T get( ) {
		return obj; 
	}
}
public class Program {

	public static void main1(String[] args) {
		//double[][] arr1  = new double[] []{ { 1.1,2.1,3.1}};
		//Unbounded generic types
		//Unbounded generic type is indicated with wild-card "?". 
		Box<?> b1;  
		b1 = new Box<Integer>(); // OK 
		//b1 = new Box<Double>(); // OK 
		//b1 = new Box<String>(); // OK 
		//b1 = new Box<Object>(); // OK 
		Object r1 = b1.get();  // get : Object 
	}
	public static void main2(String[] args) {
		//Upper bounded generic types
		Box<? extends Number>b1; 
		//b1 = new Box<Integer>(); // OK 
		//b1 = new Box<Double>(); // OK 
		//b1 = new Box<String>(); // NOT OK 
		//b1 = new Box<Float>(); // OK 
		//b1 = new Box<Object>(); // NOT OK ( object is super-class of Number) 
		Number r2 = b1.get();  // get : Number 
	}
	public static void main3(String[] args) {
		//Lower bounded generic types
		//Generic param type can be the given class or its super-class.
		Box<? super Number> b1; 
		//b1 = new Box<Object>(); // OK 
		b1 = new Box<Number>(); // OK 
		//b1 = new Box<String>(); // NOT OK 
		//b1 = new Box<Boolean>(); // NOT OK 
		Object r3 = b1.get();  // get : Object 
	}
	
	//static methods ( not generic methods) 
	public static void printAnyBox(Box<?> b1) {
		//Object r1 = b1.get(); 
		System.out.println("printAnyBox() : " + b1.get());
	}
	public static void printNumberBox(Box<? extends Number> b2) {
		//Number r1 = b2.get(); 
		System.out.println("printNumberBox() : " + b2.get());
	}
	public static void printSuperNumberBox(Box<? super Number> b3) {
		//Object r3 = b3.get(); 
		System.out.println("printSuperNumberBox() : " + b3.get());
	}
	public static void main(String[] args) {
		//String , Integer , Number(Double),Object
		Box<String> b1 = new Box<String>(); 
		b1.set("Hello");
		
		Box<Integer> b2 = new Box<Integer>(); 
		b2.set(new Integer(100));

		Box<Number> b3 = new Box<Number>(); 
		b3.set(new Double(11.33));
		
		Box<Object> b4 = new Box<Object>(); 
		b4.set(new Object());
		
//		printAnyBox(b1);
//		printAnyBox(b2);
//		printAnyBox(b3);
//		printAnyBox(b4);
		
		//printNumberBox(b1); // NOT OK ( String is not a sub-class of Number) 
		//printNumberBox(b2); // OK 
		//printNumberBox(b3); // OK 
		//printNumberBox(b4); // NOT OK ( Object is not a sub-class of Number it is super-class of Number) 
		
		//printSuperNumberBox(b1); // NOT OK ( String is not a super-class of Number) 
		//printSuperNumberBox(b2); // NOT OK ( Integer is not a super-class of Number); 
		printSuperNumberBox(b3); // OK 
		printSuperNumberBox(b4); // OK 
	}

}





