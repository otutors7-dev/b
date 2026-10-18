package com.sunbeam;

public class Program {

	public static void main(String[] args) {
		Date dt1 = new Date(1, 1, 2000); 
		Date dt2 = new Date(1, 1, 2000); 
		
		boolean res = (dt1 == dt2); 
		//System.out.println("res : " + res);
		
		res = dt1.equals(dt2); // if we don't override equals method then 
		// Object class equals method will be called and it will compare the 
		// references 
		// references cannot be same 
		//System.out.println("res : " + res);
	
		res = dt1.equals(dt2); 
		//System.out.println("res : " + res);
		
		res = dt1.equals(null); 
		//System.out.println("res : " + res);
	
		res = dt1.equals(dt1); 
		//System.out.println("res : " + res);
		
		res = dt1.equals("1-1-2000"); 
		System.out.println("res : " + res);
	}
	

}
