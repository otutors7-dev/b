package com.sunbeam.dac;

public class NonTeachingStaff extends Staff
{	
	private int numberOfLabSession;
	public void setNumberOfLabSession(int numberOfLabSession)
	{
		this.numberOfLabSession = numberOfLabSession;
	}
	public void calculateSalary()
	{
		this.salary = 500 * this.numberOfLabSession;
	}
}