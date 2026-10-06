package com.sunbeam;

public class Square implements Shape {
	private double side; 
	public Square() {
		// TODO Auto-generated constructor stub
	}
	public Square(double side) {
		this.side = side;
	}

	@Override
	public double calcPeri() {
		return 4 * this.side; 
	}

	@Override
	public double calcArea() {
		return this.side * this.side; 
	}

}
