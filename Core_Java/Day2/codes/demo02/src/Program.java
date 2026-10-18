
public class Program {

	public static void main(String[] args) {
		int a = 10; 
		//converting primitive to appropriate wrapper --- Boxing 
		Integer b = new Integer(a); // Boxing 
		
		//converting wrapper back to primitive --- unboxing 
		int c = b.intValue(); // unboxing 
		
		System.out.println(a + " , " + b  + ", " + c);
	}

}
