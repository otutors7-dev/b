
public class Program {
	
	//if we want to treat primitive types as Objects we use its appropriate wrapper 
	public static void main1(String[] args) {
		int a = 10; 
		Integer b = new Integer(a); 
		
		//type conversions 
		double d = b.doubleValue();  // Integer -> double
		
		float f = b.floatValue(); // Integer -> float 
		
		int i = b.intValue();  // Integer -> int 
		
		String str = b.toString(); 
		
		System.out.println(d + ", " + f + " , " + i  + " , " + str);
		

	}
	public static void main2(String[] args) {
		float f = 10.1f;  // float 
		Float f1 = new Float(f);  // float --- Float 
		byte by = f1.byteValue(); // Float --- byte  
		System.out.println(by);
	}
	public static void main(String[] args) {
		int a = 10 , b = 20; 
		int sum = Integer.sum(a, b); 
		System.out.println("sum " + sum);
		
		int max_value = Integer.max(a, b); 
		System.out.println("max : " + max_value);
		
		
		
		
	}

}
