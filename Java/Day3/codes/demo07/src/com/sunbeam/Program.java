package com.sunbeam;

public class Program {
	public static void main(String[] args) {
		Human[] arr = new Human[3]; 
		arr[0] = new Human(31, 78, 172);
		arr[1] = new Human(32, 79, 173);
		arr[2] = new Human(33, 80, 174);
		
		for(int i = 0 ; i < arr.length ; i++ ) {
			arr[i].display();
		}
	}
}
