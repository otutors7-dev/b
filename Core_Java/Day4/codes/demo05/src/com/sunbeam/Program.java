package com.sunbeam;
class Math{
	public static int pow(int base , int index) {
		int res = 1; 
		for(int count = 1 ; count<=index ; count++) {
			res = res * base; 
		}
		return res; 
	}
}
public class Program {

	public static void main(String[] args) {
		int res = Math.pow(2, 3); 
		System.out.println("res : " + res);
	}

}
