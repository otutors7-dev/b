package tester;

import java.util.Scanner;
import com.app.geometry.*;

public class TestPoint 
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter X and Y of point 1");
		Point2D p1 = new Point2D(sc.nextDouble(),sc.nextDouble());
		System.out.print("Enter X and Y of point 2");
		Point2D p2 = new Point2D(sc.nextDouble(),sc.nextDouble());
		
		System.out.println("Point1 details : " + p1.getDetails());
		System.out.println("Point2 details : " + p2.getDetails());
		
		if(p1.isEqual(p2))
		{
			System.out.println("Points are the Same");
		}
		else
		{
			System.out.println("Points are Different");
			System.out.println("Distance between the points = " + p1.calculateDistance(p2));
		}
	}
}
