package com.sunbeam;

import java.util.Comparator;
import java.util.List;

public class Program {
	static int outerField1 = 10;
	int outerField2 = 20;
	static int field = 30;

	public static void main(String[] args) {
		int var1 = 40; // final or effectively final
		int var2 = 50; // non-final (modified in the method)
		var2++;
		int var3 = 60;
		class Inner {
			int innerField2 = 70;
			int var3 = 80;

			void display() {
				//System.out.println("outerField1 = " + outerField1 /* Program.outerField1 */); // 10
				//System.out.println("outerField2 = " + outerField2); // error
				//System.out.println("Outer field = " + field /* Program.field */); // 30
				//System.out.println("local var of enclosing method var1 = " + var1); // 40
				//System.out.println("local var of enclosing method var2 = " + var2);
				// error: local class can access final or effectively final local vars of
				// enclosing method -- non-final vars not accessible
				System.out.println("Inner class field innerField2 = " + innerField2 /* this.innerField2 */); // 70
				System.out.println("Inner class field var3 = " + var3 /* this.var3 */); // 80
			}
		}

		Inner obj = new Inner();
		obj.display();
		
		
	}
}





