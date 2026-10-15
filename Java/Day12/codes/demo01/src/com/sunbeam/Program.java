package com.sunbeam;

import java.util.Comparator;
import java.util.Date;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Supplier;

public class Program {

	public static void main(String[] args) {
		//static method reference 
		//BinaryOperator<Integer> op = (a,b) -> Integer.sum(a, b);
		BinaryOperator<Integer> op = Integer::sum; 
		int a = 10 , b = 20; 
		Integer r = op.apply(a, b); 
		//System.out.println("res : " + r);
		
		//non-static method reference // non-static method of a class
		//Comparator<String> cmp = (x,y) -> x.compareTo(y);
		Comparator<String> cmp = String::compareTo;  
		String s1 = "Sunbeam" , s2 = "SunBeam"; 
		//System.out.println("Res : " + cmp.compare(s1, s2));
	
		//object method reference 
		//Consumer<Double> c = (d) -> System.out.println(d);
		Consumer<Double> c = System.out::println; 
		double d = 11.3; 
		c.accept(d);
		
		//constructor reference
		//Supplier<Date> supp = ( ) -> new Date();
		Supplier<Date> supp = Date::new; 
		
		System.out.println("Date : " + supp.get());
		
		
		
	}

}







