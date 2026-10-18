package com.sunbeam.dac;

import java.util.Scanner;

public class StaffFactory
{
	public static int staffMenuList()
	{
		Scanner sc = new  Scanner(System.in);
		System.out.println("0.Exit");
		System.out.println("1.Teaching Staff");
		System.out.println("2.Non Teaching Staff");
		System.out.print("Enter choice	:	");
		return sc.nextInt();
	}
	public static Staff getInstance( int choice )
	{
		Staff staff = null;
		switch( choice )
		{
			case 1:
				staff = new TeachingStaff();	//Upcasting
				break;
			case 2:
				staff = new NonTeachingStaff();	//Upcasting
				break;					
		}
		return staff;
	}
}
