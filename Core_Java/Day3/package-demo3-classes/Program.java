package sunbeam.geometry;

import sunbeam.geometry.dim2.Circle;
import sunbeam.geometry.dim3.*;

class Program {
   public static void main(String[] args) {
       Circle c = new Circle(7);
       System.out.println("Circle area: " + c.calcArea());
   
       Cylinder cyl = new Cylinder(7, 5);
       System.out.println("Cylinder volume: " + cyl.calcVolume());

       Box b = new Box(7, 5, 3);
       System.out.println("Box volume: " + b.calcVolume());
   }
}