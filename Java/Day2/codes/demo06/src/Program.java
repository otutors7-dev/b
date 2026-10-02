import java.util.ArrayList;
import java.util.List;

public class Program {

	public static void main1(String[] args) {
		int a = 10; 
		Integer b = new Integer(a); // Boxing 
		Integer c = a; // autoboxing -- java 5.0 
		int d = b.intValue(); // unboxing 
		int e = b; // auto-unboxing -- java 5.0

	}
	public static void main2(String[] args) {
		//Boxing and unboxing will take more time and space 
		Integer x = 10; //auto-boxing 
		Integer y = 20; //auto-boxing 
		Integer z = x + y; 
		/*
		 	 x is auto-unboxed to 10 
		 	 y is auto-unboxed to 20 
		 	 10 + 20 --> 30 
		 	 30 is auto-boxed to z 
		*/
		System.out.println("z : " + z);
	}
	public static void main3(String[] args) {
		int x = 10; 
		Integer y = 20; 
		List<Integer>list = new ArrayList<Integer>(); 
		list.add(y); // Integer 
		list.add(new Integer(x)); // Boxing 
		list.add(x); //autoboxing 
		System.out.println(list);
	}
	public static void main(String[] args) {
		System.out.println("MAX_VALUE : " + Integer.MAX_VALUE);
		System.out.println("MIN_VALUE : " + Integer.MIN_VALUE);
	}

}
