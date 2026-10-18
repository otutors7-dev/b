package sunbeam.geometry.dim3;

public class Box {
   private double length;
   private double breadth;
   private double height;
   public Box(double l, double b, double h) {
      this.length = l;
      this.breadth = b;
      this.height = h; 
   }
   // getters/setters
   // display()
   public double calcVolume() {
       return this.length * this.breadth * this.height;
   }
}