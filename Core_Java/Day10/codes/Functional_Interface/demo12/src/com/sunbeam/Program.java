package com.sunbeam;


public class Program {

	public static void main(String[] args) {
		Shape[] arr = {
			new Rectangle(10, 2),
			new Circle(3.1),
			new Square(4.1) 
		}; 
		//double totalArea = Shapes.calcTotalArea(arr);
		//double totalArea = Shape.calcTotalArea(arr);
		//System.out.println("Area : " + totalArea);
		for(int i = 0 ; i < arr.length ; i++) {
			System.out.println("Peri : " + arr[i].calcPeri());
		}
	}

}
