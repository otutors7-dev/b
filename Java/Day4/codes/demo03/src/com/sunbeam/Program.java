package com.sunbeam;
/* final field can be initialized using field initializer, obj initializer, or constructor.
 * Once initialized, it cannot be modified again.
 * However, final fields must be initialized (in any of the above options). 
 * If not, compiler raise error.
 */ 
class Circle{
	private final double PI = 3.14;
	private double radius; 
	{
		//PI = 3.14; //already init in field init 
	}
	
	public Circle(double radius) {
		this.radius = radius;
	}
	public void setRadius(double radius) {
		this.radius = radius;
	}
	public Circle() {
		//PI = 3.14; 
	}
	public double calcArea( ) {
		return PI * this.radius * this.radius; 
	}
	public double calcPeri( ) {
		return 2 * PI * this.radius;  
	}
	
}
public class Program {

	public static void main(String[] args) {
		final int a;  //local variable 
		a = 10; 
		//a = 11; // cannot modified 
		Circle c1 = new Circle(3.1); 
		//System.out.println("Area : " + c1.calcArea());
		//System.out.println("Peri : " + c1.calcPeri());
		
		double r = 6.1; 
		c1.setRadius(r);
		//System.out.println("Area : " + c1.calcArea());
		//System.out.println("Peri : " + c1.calcPeri());
		final Circle c2 = new Circle(5.1); 
		c2.setRadius(r);
		System.out.println("Area : " + c2.calcArea());
		System.out.println("Peri : " + c2.calcPeri());
		//c2 = null; 
	}

}
