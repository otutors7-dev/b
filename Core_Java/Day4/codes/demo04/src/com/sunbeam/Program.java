package com.sunbeam;
class Chair{
	private int height;
	private int weight;
	private static int price = 500; //field init 
	public Chair() {
		// TODO Auto-generated constructor stub
	}
	public Chair(int height, int weight) {
		this.height = height;
		this.weight = weight;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public static void setPrice(int price) {
		Chair.price = price;
	}
	public static int getPrice() {
		return price;
	}
	public void display( ) {
		System.out.printf("Height : %d Weight %d\n",this.height , this.weight);
		System.out.printf("Price : %d\n",Chair.price); // More Readable 
	}
	
}
public class Program {

	public static void main(String[] args) {
		Chair c1 = new Chair(10, 20);
		Chair c2 = new Chair(10, 20);
		//c1.display();
		//Chair.price = 1000;
		Chair.setPrice(1000);
		c1.display();
		c2.display();
		System.out.println("Updated Price : " + Chair.getPrice());

	}

}
