import java.util.Scanner;

public class Double
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter Two Double Values");
		
		if(!sc.hasNextDouble())
		{
			System.out.println("Not double values");
			return;
		}
		
		double a = sc.nextDouble();
		
		if(!sc.hasNextDouble())
		{
			System.out.println("Not double values");
			return;
		}
		double b = sc.nextDouble();

		System.out.println("Average = " +((a+b)/2) );

	}
}
