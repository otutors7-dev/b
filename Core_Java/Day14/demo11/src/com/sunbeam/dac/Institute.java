package com.sunbeam.dac;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Institute
{
	private List<Staff> staffList;
	private Institute()
	{
		this.staffList = new ArrayList<Staff>();
	}
	private static Institute institute = null;
	public static Institute getInstance()
	{
		if( institute == null )
			institute = new Institute();
		return institute;
	}
	public void addStaff( Staff staff )
	{
		staffList.add(staff);
	}
	public Staff findStaff( int staffId )
	{
		Staff key = new TeachingStaff();
		key.setStaffId(staffId);
		int index = staffList.indexOf(key);
		if( index != -1 )
			return staffList.get(index);
		return null;
	}
	public boolean removeStaff( int staffId )
	{
		Staff staff = new NonTeachingStaff();
		staff.setStaffId(staffId);
		if( staffList.contains(staff))
		{
			staffList.remove(staff);
			return true;
		}
		return false;
	}
	public float calculateSalaryExpences()
	{
		float total = 0 ;
		for (Staff staff : staffList)
		{
			total = total + staff.getSalary();
		}
		return total;
	}
	public void printStaffDetails()
	{
		Comparator<Staff> comparator = (s1,s2)->
		{
			if( s1.getStaffId() < s2.getStaffId() )
				return -1;
			else if( s1.getStaffId() > s2.getStaffId() )
				return 1;
			else
				return 0;
		};
		staffList.sort(comparator);
		staffList.forEach(System.out::println);
	}
}
