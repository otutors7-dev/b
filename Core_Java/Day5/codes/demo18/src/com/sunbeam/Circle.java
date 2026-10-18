package com.sunbeam;

public class Circle implements Shape {
	private double radius; 
	public Circle() {
		// TODO Auto-generated constructor stub
	}
	
	public Circle(double radius) {
		this.radius = radius;
	}

	@Override
	public double calcPeri() {
		return 2 * PI * this.radius; 
	}

	@Override
	public double calcArea() {
		return PI * this.radius * this.radius; 
	}

}
