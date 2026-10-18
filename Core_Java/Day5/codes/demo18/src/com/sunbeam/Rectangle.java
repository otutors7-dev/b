package com.sunbeam;

public class Rectangle implements Shape{
	private double length; 
	private double breadth;
	public Rectangle() {
		// TODO Auto-generated constructor stub
	}
	public Rectangle(double length, double breadth) {
		this.length = length;
		this.breadth = breadth;
	}

	@Override
	public double calcPeri() {
		return 2 * (this.length + this.breadth); 
	}
	@Override
	public double calcArea() {
		return this.length * this.breadth; 
	} 
}
