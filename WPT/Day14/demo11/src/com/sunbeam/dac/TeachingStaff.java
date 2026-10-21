package com.sunbeam.dac;

public class TeachingStaff extends Staff
{	
	private int numberOfTheorySession;
	public void setNumberOfTheorySession(int numberOfTheorySession)
	{
		this.numberOfTheorySession = numberOfTheorySession;
	}
	public void calculateSalary()
	{
		this.salary = 750 * this.numberOfTheorySession;
	}
}
