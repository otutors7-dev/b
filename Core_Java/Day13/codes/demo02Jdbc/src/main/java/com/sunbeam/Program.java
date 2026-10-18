package com.sunbeam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in); 
		try(Connection con = DriverManager.getConnection(DB_URl, DB_USER, DB_PASSWORD)){
			String sql = "SELECT * FROM students WHERE marks > ?"; 
			try(PreparedStatement stmt = con.prepareStatement(sql)){
				System.out.print("Enter the minMarks : ");
				double minMarks = sc.nextDouble(); 
				stmt.setDouble(1, minMarks);
				try(ResultSet rs = stmt.executeQuery()){
					while(rs.next()) {
						int roll = rs.getInt("roll"); 
						String name = rs.getString("name"); 
						double marks = rs.getDouble("marks");
						System.out.println(roll + " ," + name + " ," + marks);
					}
				}//rs.close(); 
			}//stmt.close(); 
		}//con.close(); 
		catch (Exception e) {
			e.printStackTrace();
		}

	}

}






