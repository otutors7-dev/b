package sunbeam.geometry;

import sunbeam.geometry.dim2.Circle;
import sunbeam.geometry.dim3.Box;
import sunbeam.geometry.dim3.Cylinder;

public class Program {

	public static void main(String[] args) {
		Circle c = new Circle(3.1); 
		System.out.println("Area : " + c.calcArea());
		Cylinder cy = new Cylinder(4.1, 5.1); 
		System.out.println("Area : " + cy.calcVolume());
		
		Box b = new Box(3.1, 4.1, 5.1); 
		System.out.println("Area : " + b.calcVolume());
		
		 

	}

}
