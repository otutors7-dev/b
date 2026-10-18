package com.sunbeam;
public class Program {
	public static void print(Object... arr) {
		for(int i = 0 ; i < arr.length ; i++) {
			System.out.println(arr[i]);
		}
	}
	public static  void main(String[] args) {
		Program.print("Hello" , 1.2, 100);
	}
}
/*
public class Program {
	//variable arity method -- java 5.0 
	public static double arraySum(double... a) {
		double sum = 0.0; 
		for(int i = 0 ; i < a.length ; i++) {
			sum = sum + a[i]; 
		}
		return sum; 
	}
	public static  void main(String[] args) {
		double r1 = Program.arraySum(1.1,2.3,3.1); 	
		System.out.println("r1 : " + r1);
		
		double r2 = Program.arraySum(5.1,6.1,7.1); 
		System.out.println("r2 : " + r2);
		
		double r3 = Program.arraySum(7.1,8.1,9.1); 
		System.out.println("r2 : " + r3);
		
	}

}*/ 
/*
public class Program {
	public static double arraySum(double[] a) {
		double sum = 0.0; 
		for(int i = 0 ; i < a.length ; i++) {
			sum = sum + a[i]; 
		}
		return sum; 
	}
	public static  void main(String[] args) {
		double[] arr1 = {1.1,2.1,3.1}; //named array 
		double r1 = Program.arraySum(arr1); 
		System.out.println("r1 : " +r1);	
		
		double[] arr2 = {4.1,5.1,6.1}; // named array 
		double r2 = Program.arraySum(arr2); 
		System.out.println("r2 : " +r2);
		
		double[] arr3 = {5.1,6.1,7.1}; // named array 
		double r3 = Program.arraySum(arr2); 
		System.out.println("r2 : " +r3);
		
		double r4 = Program.arraySum(new double[] {1.1,2.1,3.1}); // Annonymous array 
		System.out.println("r4 : " + r4);
	}

}*/ 
