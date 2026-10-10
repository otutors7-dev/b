package com.sunbeam;

public class Program {

	public static void main(String[] args) {
		try {
			Time t1 = new Time(1, 1, 2000); 
			t1.setHrs(10);
			t1.setMins(10);
			t1.setSecs(10);
			System.out.println("Time : " + t1.toString());
		}
		catch (InvalidTimeException e) {
			System.out.println("Field : " + e.getInvalidField());
			System.out.println("Value : " + e.getInvalidValue());
			System.out.println("Message : " + e.getMessage());
		}

	}

}
