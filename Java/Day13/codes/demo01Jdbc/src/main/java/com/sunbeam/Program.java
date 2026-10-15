package com.sunbeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Program {
	public static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver"; 
	public static final String DB_URl = "jdbc:mysql://localhost:3306/test"; 
	public static final String DB_USER = "root";
	public static final String DB_PASSWORD = "manager";
	static {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	public static void main1(String[] args) {
		try(Connection con = DriverManager.getConnection(DB_URl, DB_USER, DB_PASSWORD)){
			try(Statement stmt = con.createStatement()){
				String sql = "SELECT * FROM students"; 
				try(ResultSet rs = stmt.executeQuery(sql)){
					while(rs.next()) {
						int roll = rs.getInt("roll");
						String name = rs.getString("name"); 
						double marks = rs.getDouble("marks");
						System.out.println(roll + " , " + name + " , " + marks);
					}
				}
			}//stmt.close();
		}//con.close() 
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		try(Connection con = DriverManager.getConnection(DB_URl, DB_USER, DB_PASSWORD)){
			 try(Statement stmt = con.createStatement()){
				 System.out.print("Roll : ");
				 int roll = sc.nextInt(); 
				 System.out.print("Name : ");
				 String name = sc.next(); 
				 System.out.println("Marks : ");
				 double marks = sc.nextDouble(); 
				 String sql = "INSERT INTO students VALUES("+roll+",'"+name+"',"+marks+")"; 
				 int count = stmt.executeUpdate(sql); 
				 System.out.println("Rows Affected : " + count);
			 }//stmt.close(); 
		}//con.close(); 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}










