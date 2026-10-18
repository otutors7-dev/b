package com.sunbeam;

import java.util.Scanner;

public class Emp {
	private int id; 
	private String name; 
	private double salary; 
	private Date joining; 
	public Emp() {
		this.id = 0; 
		this.name =""; 
		this.salary = 0.0; 
		this.joining = new Date(); 
	}
	public Emp(int id, String name, double salary, Date joining) {
		this.id = id;
		this.name = name;
		this.salary = salary;
		this.joining = joining;
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
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public Date getJoining() {
		return joining;
	}
	public void setJoining(Date joining) {
		this.joining = joining;
	}
	public void accept( ) {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Id : ");
		id = sc.nextInt(); 
		System.out.print("Name : ");
		name = sc.next(); 
		System.out.print("Salary : ");
		salary = sc.nextDouble(); 
		this.joining.accept();
	}
	public void display( ) {
		System.out.printf("Id : %d\nName : %s\nSalary : %.2f\n",id,name,salary);
		this.joining.display();
	}
	
}
