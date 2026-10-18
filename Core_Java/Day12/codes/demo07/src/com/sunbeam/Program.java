package com.sunbeam;

import java.util.ArrayList;
import java.util.List;
@Deprecated
class FirstClass{
	@Deprecated
	public void method1( ) {
		//TODO
	}
	@Deprecated
	public void method2( ) {
		
	}
}
public class Program {

	@SuppressWarnings({ "unused", "rawtypes" })
	public static void main1(String[] args) {
		//@SuppressWarnings("unused")
		String name = "Sunbeam"; 
		
		//@SuppressWarnings("unused")
		List list = new ArrayList(); 

	}
	public static void main(String[] args) {
		FirstClass obj = new FirstClass(); 
		obj.method1();
		obj.method2();
	}

}
