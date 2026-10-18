package com.sunbeam;

import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class Program {
	public static void writeRecord(String path) throws Exception{
		try(FileWriter fw = new FileWriter(path)){
			for(char ch = 'A' ; ch <= 'Z' ; ch++) {
				fw.write(ch);
			}
		}
	}
	public static void readRecord(String path) throws Exception{
		int data; 
		try(FileReader rd = new FileReader(path)){
			while((data = rd.read())!=-1) {
				System.out.print((char)data);
			}
		}
		System.out.println();
	}
	public static int menuList( ) {
		Scanner sc = new Scanner(System.in); 
		System.out.println("0.Exit");
		System.out.println("1.Write Record");
		System.out.println("2.Read Record");
		System.out.print("Enter the choice : ");
		int choice = sc.nextInt(); 
		return choice; 
	}
	public static void main(String[] args) {
		int choice; 
		String path = "File1.txt"; 
		while((choice = menuList())!=0) {
			try {
				switch (choice) {
				case 1:
					Program.writeRecord(path);
					break;
				case 2: 
					Program.readRecord(path);
					break; 
				default:
					System.out.println("Invalid choice");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}








