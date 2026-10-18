package com.sunbeam;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Program {
	
	/*
	//Handling the problems Programmatically 
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Enter num : ");
		int num = sc.nextInt(); 
		System.out.print("Enter den : ");
		int den = sc.nextInt(); 
		if(den!=0) {
			int res = num / den; 
			System.out.println("Res : " + res);
		}
		else 
			System.out.println("Divide by zero");
	}*/
	
	/*
	//Handling the problems Programmatically 
	  //acceptable in all scenarios 
	public static int divide(int num , int den) {
		if(den == 0) {
			System.out.println("Divide by zero");
			System.exit(0);
		}
		int res = num / den; 
		return res; 
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Enter num : ");
		int num = sc.nextInt(); 
		System.out.print("Enter den : ");
		int den = sc.nextInt(); 
		
		int res = divide(num, den); 
		System.out.println("res : " + res);
		
	}*/ 
	
	/*
	//detect the problem and throw the problem 
	public static int divide(int num , int den) {
		if(den == 0)
			throw new RuntimeException("Divide by zero"); 
		int res = num / den; 
		return res; 
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Enter num : ");
		int num = sc.nextInt(); 
		System.out.print("Enter den : ");
		int den = sc.nextInt(); 
		try {
			int res = divide(num, den); 
			System.out.println("res : " + res);
		}
		catch (RuntimeException e) {
			System.out.println("Divide by zero");
		}
	}*/ 
	
	/*
	//detect the problem and throw the problem 
	public static int divide(int num, int den) {
		int res = num / den;
		return res;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		try {
			System.out.print("Enter num : ");
			int num = sc.nextInt();
			System.out.print("Enter den : ");
			int den = sc.nextInt();
			int res = divide(num, den);
			System.out.println("res : " + res);
		} catch (ArithmeticException e) {
			System.out.println("Divide by zero");
		}
		catch (InputMismatchException e) {
			System.out.println("Incorrect I/P");
		}

	}*/
	/*
	//detect the problem and throw the problem 
	public static int divide(int num, int den) {
		int res = num / den;
		return res;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		try {
			System.out.print("Enter num : ");
			int num = sc.nextInt();
			System.out.print("Enter den : ");
			int den = sc.nextInt();
			int res = divide(num, den);
			System.out.println("res : " + res);
		} catch (ArithmeticException  | InputMismatchException e) {
			System.out.println("Incorrect I/p");
		}
		finally {
			sc.close(); //close the resource 
			// we can use try-with-resource
		}
		
	}*/ 
    //Written after method declaration to specify list of exception not handled 
    //by called method and to be handled by calling method.
	
	// detect the problem and throw the problem as checked 
	public static int divide(int num, int den) throws Exception {
		int res = num / den;
		return res;
	}

	public static void main(String[] args)  {
		Scanner sc = new Scanner(System.in);

		try {
			System.out.print("Enter num : ");
			int num = sc.nextInt();
			System.out.print("Enter den : ");
			int den = sc.nextInt();
			int res = divide(num, den);
			System.out.println("res : " + res);
		}
		catch (Exception e) {
			System.out.println("Divide by zero");
		}

	}

}
