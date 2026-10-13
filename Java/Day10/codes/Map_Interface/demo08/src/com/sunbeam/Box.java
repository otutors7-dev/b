package com.sunbeam;

import java.util.Objects;

public class Box {
	private  int length;
	private  int breadth;
	private  int height; 
	
	public Box() {
		// TODO Auto-generated constructor stub
	}

	public Box(int length, int breadth, int height) {
		this.length = length;
		this.breadth = breadth;
		this.height = height;
	}
	@Override
	public int hashCode() {
		return Objects.hash(length,breadth,height);  
	}
	
}
