package com.sunbeam;

import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter two numbers: ");
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		int result;
		System.out.println("\n0. Exit\n1. Add\n2. Subtract\n3. Multiply\n4. Divide\nEnter choice: ");
		int choice = sc.nextInt();
		switch (choice) {
		case 1:
			result = num1 + num2;
			System.out.println("Result: " + result);
			break;
		case 2:
			result = num1 - num2;
			System.out.println("Result: " + result);
			break;
		case 3:
			result = num1 * num2;
			System.out.println("Result: " + result);
			break;
		case 4:
			result = num1 / num2;
			System.out.println("Result: " + result);
			break;
		}

	}

}