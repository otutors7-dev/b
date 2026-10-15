package com.sunbeam;

import java.awt.SystemColor;
import java.io.IOException;

public class Program {

	public static void main(String[] args) throws Throwable {
		System.out.println("START");
		Runtime rt = Runtime.getRuntime(); 
		Process process = rt.exec("Notepad"); 
		int status = process.waitFor(); 
		System.out.println("status : " + status);
		System.out.println("END");
	}

}
