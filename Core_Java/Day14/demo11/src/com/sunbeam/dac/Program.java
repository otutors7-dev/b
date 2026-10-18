package com.sunbeam.dac;
import java.util.Scanner;

public class Program
{
	static Scanner sc = new Scanner(System.in);	
	public static void acceptRecord( Staff staff )
	{
		System.out.print("Name	:	");
		staff.setName(sc.next());
		System.out.print("Staff id	:	");
		staff.setStaffId(sc.nextInt());
		if( staff instanceof TeachingStaff )
		{
			TeachingStaff teachingStaff = ( TeachingStaff ) staff;	//Downcasting
			System.out.print("Theroy Session	:	");
			teachingStaff.setNumberOfTheorySession(sc.nextInt());
		}
		else
		{
			NonTeachingStaff nonTeachingStaff = ( NonTeachingStaff ) staff;	//Downcasting
			System.out.print("Lab Session	:	");
			nonTeachingStaff.setNumberOfLabSession(sc.nextInt());
		}
		staff.calculateSalary();
	}
	public static void printRecord( Staff staff )
	{
		System.out.println(staff.toString());
	}
	public static void addStaff(Institute institute)
	{
		int choice;
		while( ( choice = StaffFactory.staffMenuList( ) ) != 0 )
		{
			Staff staff = StaffFactory.getInstance(choice);
			if( staff != null )
			{
				Program.acceptRecord(staff);
				institute.addStaff(staff);
			}
		}
	}
	public static void findStaff( Institute institute )
	{
		System.out.print("Enter staff id	:	");
		int staffId = sc.nextInt();
		Staff staff = institute.findStaff(staffId);
		if( staff != null )
			Program.printRecord(staff);
		else
			System.out.println("Staff not found.");
	}
	public static void removeStaff( Institute institute )
	{
		System.out.print("Enter staff id	:	");
		int staffId = sc.nextInt();
		boolean removedStatus = institute.removeStaff(staffId);
		System.out.println(removedStatus?"Staff is removed":"Staff not  removed");
	}
	public static void calculateSalaryExpences( Institute  institute )
	{
		float salaryExpences = institute.calculateSalaryExpences();
		System.out.println("Total salary	:	"+salaryExpences);
	}
	public static void printDetails( Institute institute )
	{
		institute.printStaffDetails();
	}
	public static int instituteMenuList()
	{
		System.out.println("0.Exit");
		System.out.println("1.Add New Staff");
		System.out.println("2.Find Staff");
		System.out.println("3.Remove Staff");
		System.out.println("4.Calculate Salary Expences");
		System.out.println("5.Print Staff Details.");
		System.out.print("Enter choice	:	");
		return sc.nextInt();
	}
	public static void main(String[] args)
	{
		int choice;
		Institute institute = Institute.getInstance();
		while( ( choice = Program.instituteMenuList( ) ) != 0 )
		{
			switch( choice )
			{
				case 1:
					Program.addStaff( institute );
					break;
				case 2:
					Program.findStaff( institute );
					break;
				case 3:
					Program.removeStaff( institute );
					break;
				case 4:
					Program.calculateSalaryExpences(institute);
					break;
				case 5:
					Program.printDetails( institute );
					break;
			}
		}
	}
}
