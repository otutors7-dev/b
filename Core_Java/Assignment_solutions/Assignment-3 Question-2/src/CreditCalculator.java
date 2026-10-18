import java.util.Scanner;

public class CreditCalculator
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter account number (-1 to quit) : ");
		int accountNumber = sc.nextInt();

		while (accountNumber != -1)
		{
			System.out.print("Enter balance at the beginning of the month : ");
			int beginningBalance = sc.nextInt();

			System.out.print("Enter total of all items charged this month : ");
			int totalCharges = sc.nextInt();

			System.out.print("Enter total of all credits applied this month : ");
			int totalCredits = sc.nextInt();

			System.out.print("Enter allowed credit limit : ");
			int creditLimit = sc.nextInt();

			int newBalance = beginningBalance + totalCharges - totalCredits;

			System.out.println("Account " + accountNumber + " new balance : " + newBalance);

			if (newBalance > creditLimit)
			{
				System.out.println("Credit limit exceeded");
			}

			System.out.println();
			System.out.print("Enter account number (-1 to quit) : ");
			accountNumber = sc.nextInt();
		}

		sc.close();
	}
}