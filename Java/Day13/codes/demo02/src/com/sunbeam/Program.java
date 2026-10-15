package com.sunbeam;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Program {

	public static void main1(String[] args) {
		try(FileWriter fw = new FileWriter("File1.txt")){
			fw.write("Sunbeam Infotech");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void main2(String[] args) {
		try(FileOutputStream fout = new FileOutputStream("File2.txt")){
			try(OutputStreamWriter ow = new OutputStreamWriter(fout)){
				ow.write("Sunbeam Infocom");
			}//ow.close(); 
		}//fout.close(); 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main3(String[] args) {
		int data; 
		try(FileReader rd = new FileReader("File1.txt")){
			while((data = rd.read())!=-1) {
				System.out.print((char)data);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		int data; 
		try(FileInputStream fin = new FileInputStream("File2.txt")){
			try(InputStreamReader rd = new InputStreamReader(fin)){
				while((data = rd.read())!=-1) {
					System.out.print((char)data);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}



