package com.sunbeam;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Program {
	static final String EMP_FILE = "emp.csv";
	private static Emp parseEmp(String line) {
		String[] parts = line.split(",");
		int empno = Integer.parseInt(parts[0]); 
		String ename = parts[1]; 
		String job = parts[2]; 
		int mgr; 
		try {
			mgr = Integer.parseInt(parts[3]); 
		} catch (Exception e) {
			mgr = 0; 
		}
		String hire = parts[4]; 
		int sal = (int) Double.parseDouble(parts[5]);
		int comm; 
		try {
			comm = Integer.parseInt(parts[6]); 
		} catch (Exception e) {
			comm = 0; 
		}
		int deptno = Integer.parseInt(parts[7]); 
		Emp emp = new Emp(empno, ename, job, mgr, hire, sal, comm, deptno); 
		return emp; 
	}
	public static void main1(String[] args) {
		try(FileInputStream fin = new FileInputStream(EMP_FILE)){
			try(Scanner sc = new Scanner(fin)){
				while(sc.hasNextLine()) {
					String line = sc.nextLine(); 
					System.out.println(line);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void main(String[] args) {
		List<Emp> list = new ArrayList<>(); 
		try(FileInputStream fin = new FileInputStream(EMP_FILE)){
			try(Scanner sc = new Scanner(fin)){
				while(sc.hasNextLine()) {
					String line = sc.nextLine(); 
					Emp emp = parseEmp(line); 
					list.add(emp); 
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		int total = 0; 
		for (Emp e : list) {
			if(e.getJob().equals("MANAGER")) {
				total = total + e.getSal(); 
			}
		}
		System.out.println("Total : " + total);
	}
	

}


