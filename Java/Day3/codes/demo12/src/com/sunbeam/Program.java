package com.sunbeam;
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

}
/*
public class Program {
	public static int divide(int a, int b) {
		int r = a / b; 
		return r; 
	}
	public static double divide(int a , int b) {
		double r = (double)a / b; 
		return r; 
	}
	public static void main(String[] args) {
		int r1 = Program.divide(20, 10); 
		double r2 = Program.divide(20, 10); 
		Program.divide(30, 10); 
	}

}*/ 
/*
public class Program {
	public static void add(int a, int b , int c , int d) {
		int res = a + b + c + d; 
		System.out.println("res : " + res);
	}
	public static void add(int a, int b , int c) {
		int res = a + b + c; 
		System.out.println("res : " + res);
	}
	public static void add(int a, int b) {
		int res = a + b; 
		System.out.println("res : " + res);
	}
	public static void main(String[] args) {
		Program.add(10, 20); 
		Program.add(10, 20,30);
		Program.add(10, 20,30,40);

	}

}*/
