package com.sunbeam;

public class Chair {
	private int height; 
	private int weight; 
	private static int price = 100;
	public Chair() {
		// TODO Auto-generated constructor stub
	}
	static {
		System.out.println("static block -- 1");
		price = 200; 
	}
	static {
		System.out.println("static block -- 2");
		price = 300; 
	}
	public Chair(int height, int weight) {
		this.height = height;
		this.weight = weight;
	}
	public static void setPrice(int price) {
		Chair.price = price;
	}
	public static int getPrice() {
		return price;
	}
	public void display( ) {
		System.out.printf("Heigth : %d Weight : %d Price : %d\n",this.height, this.weight,Chair.price);
	}
	
}
