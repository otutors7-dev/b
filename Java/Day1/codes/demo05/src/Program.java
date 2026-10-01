
public class Program {

	public static void main1(String[] args) {
		short s = 10; 
		int i = s; //widening 
		System.out.println("short : " + s);
		System.out.println("integer : " + i);
	}
	public static void main(String[] args) {
		int i = 10; 
		//short s = i; // NOT OK ( direct conversion not possible) 
		short s = (short) i;
		System.out.println("short : " + s);
		System.out.println("integer : " + i);
		
	}

}
