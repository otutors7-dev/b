package com.sunbeam;

import java.awt.desktop.SystemSleepEvent;
import java.util.ArrayList;
import java.util.List;

public class Program {

	public static void main1(String[] args) {
		try(StudentDao studentDao = new StudentDaoImpl()){
			Student s = studentDao.findByID(1); 
			System.out.println(s.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void main2(String[] args) {
		List<Student> list = new ArrayList<>(); 
		try(StudentDao studentDao = new StudentDaoImpl()){
			list = studentDao.findAll(); 
			for (Student s : list) {
				System.out.println(s.toString());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		try(StudentDao studentDao = new StudentDaoImpl()){
			Student s = new Student(16, "Sandeep",91.33); 
			int cnt = studentDao.save(s); 
			System.out.println("Rows affected : " + cnt);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
