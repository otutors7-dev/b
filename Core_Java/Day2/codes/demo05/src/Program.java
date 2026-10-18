
public class Program {

	public static void main(String[] args) {
		int number = 10; 
		// int -> String
		String str = String.valueOf(number); 
		System.out.println("str : " + str);//10 
		
		
		String strNumber = "100"; 
		//String -> int 
		int x = Integer.parseInt(strNumber); 
		System.out.println("x  : " + x);//100 
		
	}

}
