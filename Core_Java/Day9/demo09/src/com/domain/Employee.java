package com.domain;

public class Employee implements Comparable<Employee> {
	private int empid;
	private String name;
	private double salary;

	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(int empid, String name, double salary) {
		this.empid = empid;
		this.name = name;
		this.salary = salary;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj == null)
		  return false; 
		if(this == obj) 
		  return true; 
		if(!(obj instanceof Employee))
		  return false; 
		Employee other = (Employee) obj;
		return this.empid == other.empid; 
	}
	@Override
	public String toString() {
		return String.format("%-20d%-15s%-10.2f", empid, name, salary);
	}

	@Override
	public int compareTo(Employee o) {
		return Integer.compare(this.empid,o.empid); 
	}

}