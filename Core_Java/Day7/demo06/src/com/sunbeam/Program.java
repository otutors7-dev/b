package com.sunbeam;
//Bounded generic types
//T can be any type so that T is Number or its sub-class.
class Box<T extends Number>{
	private T obj; 
	public void set(T obj) {
		this.obj = obj; 
	}
	public T get( ) {
		return obj; 
	}
}
public class Program {

	public static void main(String[] args) {
		Box<Integer> b1 = new Box<Integer>(); 
		b1.set(100);
		Integer r1 = b1.get(); 
		System.out.println("r1 : " + r1);
		
		Box<Double> b2 = new Box<Double>(); 
		b2.set(11.33);
		Double r2 = b2.get(); 
		System.out.println("r2 : " + r2);
		
		Box<Number> b3 = new Box<Number>(); 
		b3.set(new Integer(100));
		Integer r3 = (Integer) b3.get(); 
		System.out.println("r3 : " + r3);
		
		//Box<Boolean> b2 = new Box<>(); // error
	    //Box<Character> b3 = new Box<>(); // error
	    //Box<String> b4 = new Box<>(); // error
	    //Box<Date> b7 = new Box<>(); // error
	    //Box<Object> b8 = new Box<>(); // error
	}

}
