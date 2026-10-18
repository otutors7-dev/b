package com.sunbeam;

public class Human {
	private int age; 
	private int weight; 
	private int height; 
	public Human() {
		// TODO Auto-generated constructor stub
	}
	public Human(int age, int weight, int height) {
		this.age = age;
		this.weight = weight;
		this.height = height;
	}
	//getters / setters 
	public void display( ) {
		System.out.printf("Age : %d weight : %d height : %d ",age,weight,height);
		System.out.println("\n");
	}
	
}
