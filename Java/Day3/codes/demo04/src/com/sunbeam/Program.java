package com.sunbeam;

import java.util.Scanner;

public class Program {
	public static void acceptRecord(int[] a) {
		System.out.print("Enter the elements : ");
		Scanner sc = new Scanner(System.in); 
		for(int i = 0 ; i < a.length ; i++) {
			a[i] = sc.nextInt(); 
		}
	}
	public static void printRecord(int[] a) {
		for(int i = 0 ; i < a.length ; i++) {
			System.out.print(a[i] + " ");
		}
	}
	public static void main(String[] args) {
		int[] arr = new int[3];
		Program.acceptRecord(arr);
		Program.printRecord(arr);
	}
	public static void main4(String[] args) {
		int[] arr = new int[-3];  // java.lang.NegativeArraySizeException
		
	}
	public static void main3(String[] args) {
		int[] arr = new int[3]; 
		System.out.println(arr[4]); // java.lang.ArrayIndexOutOfBoundsException:
	}
	public static void main2(String[] args) {
		int[] arr = null; 
		arr = new int[3]; 
		arr[0] = 10; 
		arr[1] = 20; 
		arr[2] = 30; 
		for(int e : arr)
			System.out.println(e);
	}
	public static void main1(String[] args) {
		//int[] arr = null;
		//int arr[] = null;
		
		
	}

}
