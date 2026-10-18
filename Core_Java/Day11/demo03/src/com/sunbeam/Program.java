package com.sunbeam;

import java.util.function.BinaryOperator;
import java.util.function.Predicate;

//lambda expressions are referenced by functional interface reference.
//lambda arg scope is limited to lambda expression body/implementation.
public class Program {

	public static void main(String[] args) {
		
		//non-capturing lambda
		BinaryOperator<Integer> op = (x,y) -> x + y; 
		int z = 10;
		//z++; 
		
		// capturing lambda - captures (attach) a variable out-side the lambda implementation.
		// can capture variables that are final or effectively final.
		BinaryOperator<Integer> op2 = (x,y) -> x + y + z;
		
		int a = 22 , b = 7; 
		Integer r = op.apply(a, b); 
		System.out.println("res : " + r);
		
		r = op2.apply(a, b); 
		System.out.println("res : " + r);
		
		calc(22, 10, (x,y) -> x * y);
		calc(22, 10, (x,y) -> x * y * z);
	}
	public static void calc(int n1 , int n2 , BinaryOperator<Integer> op) {
		 Integer r = op.apply(n1, n2); 
		 System.out.println("res : " + r);
	}

}





