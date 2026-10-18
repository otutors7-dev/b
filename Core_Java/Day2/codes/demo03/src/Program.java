
public class Program {

	public static void main(String[] args) {
		//converting primitive to appropriate wrapper --- Boxing 
		int a = 10; 
		Integer b = new Integer(a); // Boxing 
		Integer c = a;  // auto-boxing ( java 5.0) 
		
		int d = b.intValue(); // unboxing 
		int e = c; // auto-unboxing 
		
		System.out.println(a + ", " + b + ", " + c + ", " + d + ", " + e);

	}

}
