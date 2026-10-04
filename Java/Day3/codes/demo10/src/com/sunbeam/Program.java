package com.sunbeam;

public class Program {
	
	//java com.sunbeam.Program 10 20 30 
	public static void main(String[] args) {
		int sum = 0; 
		for(int i = 0 ; i < args.length ; i++) {
			String arg = args[i]; 
			int number = Integer.parseInt(arg); 
			sum = sum + number; 
		}
		System.out.println("sum : " + sum);

	}

}
