package com.sunbeam;

public class Employee {
	private int id;
	private String name;
	private String job;
	private String dept;
	private double sal;
	public Employee() {
	}
	public Employee(int id, String name, String job, String dept, double sal) {
		this.id = id;
		this.name = name;
		this.job = job;
		this.dept = dept;
		this.sal = sal;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", job=" + job + ", dept=" + dept + ", sal=" + sal + "]";
	}
	
}
