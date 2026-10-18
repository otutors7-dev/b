
public class Program {

	public static void main(String[] args) {
		System.out.println("Entry Point method()");
		Program.main(10,20);
		Program.main(); 
 
	}
	//overloaded method with 2 ints arguments 
	public static void main(int a , int b) {
		System.out.println("main method with 2 ints arguments");
	}
	//overloaded method with no arguments 
	public static void main() {
		System.out.println("main method with no arguments");
	}

}
