package com.sunbeam;

import java.io.FileReader;
import java.nio.charset.Charset;
import java.util.SortedMap;

public class Program {

	public static void main1(String[] args) {
		SortedMap<String, Charset> map = Charset.availableCharsets(); 
		System.out.println("size : " + map.size());
		map.forEach((K,V) -> System.out.println(K + "" + V));
	}
	public static void main(String[] args) {
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
	public static void main2(String[] args) {
		int data; 
		try(FileReader rd = new FileReader("File2.txt")){
			while((data = rd.read())!=-1) {
				System.out.print((char)data);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
