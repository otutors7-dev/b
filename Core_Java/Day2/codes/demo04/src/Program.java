
public class Program {

	public static void main1(String[] args) {
		//converting primitive to its appropriate wrapper 
		int i = 10; 
		Integer j = new Integer(i); // Boxing 
		Integer k = i; // auto-boxing 

	}
	public static void main(String[] args) {
		Integer x = new Integer(10); // Boxing 
		int y = x.intValue(); // unboxing 
		int z = x; // auto-unboxing 
		System.out.println(x + " ," + y + " , " + z);
	}

}






