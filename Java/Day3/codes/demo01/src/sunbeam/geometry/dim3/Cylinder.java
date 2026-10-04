package sunbeam.geometry.dim3;

public class Cylinder {
   private double radius;
   private double height;
   public Cylinder(double r, double h) {
      this.radius = r;
      this.height = h;
   }
   // getters/setters
   // display()
   public double calcVolume() {
       return 2 * 3.142 * this.radius * this.height;
   }
}
