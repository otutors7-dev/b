import java.util.Scanner;

public class Menu
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		String c;
		int q;
		int Amount=0;
		System.out.println("====Menu======\n"
				+ "Dosa --30\n"
				+ "Samosa --20\n"
				+ "Idli --25\n"
				+ "Press 4 to Generate Bill");
		
		do
		{
			System.out.print("Enter choice : ");
			c = sc.next();
			
			switch (c)
			{
			
			case "Dosa":
				System.out.print("Enter Quantity : ");
				q = sc.nextInt();
				Amount += (q*30);
				break;
				
			case "Samosa":
				System.out.print("Enter Quantity : ");
				q = sc.nextInt();
				Amount += (q*20);
				break;
				
			case "Idli":
				System.out.print("Enter Quantity : ");
				q = sc.nextInt();
				Amount += (q*25);
				break;
			case "4":
				break;
			default:
				System.out.println("Invalid choice");
			}
		}while(!c.equals("4"));
		
		System.out.println("Total Bill = " + Amount);
	}
}
