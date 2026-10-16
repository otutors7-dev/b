package com.sunbeam.dac;

public abstract class Staff
{
	private String name;
	private int staffId;
	float salary;
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getStaffId()
	{
		return staffId;
	}
	public void setStaffId(int staffId)
	{
		this.staffId = staffId;
	}
	public float getSalary()
	{
		return salary;
	}
	public abstract void calculateSalary();
	
	@Override
	public boolean equals(Object obj)
	{
		if( obj != null )
		{
			Staff other = ( Staff ) obj;
			if( this.staffId == other.staffId )
				return true;
		}
		return false;
	}
	@Override
	public String toString()
	{
		return String.format("%-15s%-5d%-7.2f", this.name,this.staffId,this.salary);
	}
}
