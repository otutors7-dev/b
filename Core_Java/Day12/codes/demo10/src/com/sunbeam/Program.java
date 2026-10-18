package com.sunbeam;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in); 
		System.out.print("Enter the srcFile : ");
		String srcPath = sc.next(); 
		System.out.print("Enter the destFile : ");
		String destPath = sc.next(); 
		int data; 
		int count = 0; 
		try(FileInputStream fin = new FileInputStream(srcPath)){
			try(FileOutputStream fout = new FileOutputStream(destPath)){
				while((data = fin.read())!=-1) {
					fout.write(data);
					count++; 
				}
			}//fout.close(); 
			System.out.println("Total Bytes : " + count);
		}//fin.close() 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}






