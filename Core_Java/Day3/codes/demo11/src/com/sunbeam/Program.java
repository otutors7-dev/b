package com.sunbeam;

/*
public class Program {
	public static void swap(int x , int y) {
		int temp = x; 
		x = y; 
		y = temp; 
		System.out.println("x = " + x + " y = " + y);
	}
	public static void main(String[] args) {
		int a = 10 , b = 20; 
		Program.swap(a, b);
		System.out.println("a = " + a + " y = " + b);

	}

}*/

/*
public class Program {
	public static void swap(int[] x) {
		int temp = x[0]; 
		x[0] = x[1]; 
		x[1] = temp; 
		System.out.println("x[0] = " + x[0] + " x[1] = " + x[1]);
	}
	public static void main(String[] args) {
		int[] a = {10 ,20 } ; 
		Program.swap(a);
		System.out.println("a[0] = " + a[0] + " a[1] = " + a[1]);

	}

}*/ 
public class Program {
	public static void print(int[] x) {
		x = new int[3]; 
		x[0] = 10; 
		x[1] = 20; 
		x[2] = 30; 
		for(int e : x)
			System.out.println(e);
	}
	public static void main(String[] args) {
		int[] arr = new int[2]; 
		Program.print(arr);
		arr[0] = 10; 
		arr[1] = 20; 
		arr[2] = 30; 
		for(int e : arr)
			System.out.println(e);

	}

}
