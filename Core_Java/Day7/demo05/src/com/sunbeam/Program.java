package com.sunbeam;

import java.util.ArrayList;
import java.util.List;

class Box<TYPE>{
	private TYPE obj; 
	public void set(TYPE obj) {
		this.obj = obj; 
	}
	public TYPE get( ) {
		return this.obj; 
	}
}
public class Program {

	public static void main1(String[] args) {
		Box<Integer> b1 = new Box<Integer>();
		b1.set(new Integer(100));
		Integer r1 = b1.get(); // TYPE : Integer  
		System.out.println("r1 : " + r1);
		
		Box<Double> b2 = new Box<Double>(); 
		b2.set(new Double(11.33));
		Double r2 = b2.get(); 
		System.out.println("r2 : " + r2);
		
		Box<String> b3 = new Box<String>(); 
		b3.set("Hello");
		String r3 = b3.get(); 
		System.out.println("r3 : " + r3);
		
		Box<Integer> b4 = new Box<Integer>(); 
		//b4.set("123"); // type-checking is done by java compiler at compile time 
		
		Box b5 = new Box( ); 
		b5.set(new Integer(100)); //The method set(Object) belongs to the raw type Box
		Integer r5 = (Integer) b5.get();
		System.out.println("r5 : " + r5);
		
		//Box<Object> b6 = new Box<Object>(); //not recommended 
		
		
	}
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		list.add(10);
		list.add(20);
		list.add(30);
		list.add(40);
		//list.add("50"); // type-checking at compile time 
		
		for(Integer i : list) {
			System.out.println(i);
		}
		
	}

}






