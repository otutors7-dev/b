package com.sunbeam;

import java.util.ArrayList;
import java.util.List;

// java generic class till 1.4 
class Box{
	private Object obj; 
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public Object getObj() {
		return obj;
	}
}
public class Program {

	public static void main(String[] args) {
		Box b1 = new Box(); 
		b1.setObj(new Integer(100));
		Integer r1 = (Integer) b1.getObj();  
		System.out.println("r1 : " +r1);
		
		Box b2 = new Box(); 
		b2.setObj(new Double(11.3));
		Double r2 = (Double) b2.getObj();
		System.out.println("r2 : " + r2);
		
		Box b3 = new Box(); 
		b3.setObj("Hello");
		String r3 = (String) b3.getObj();
		System.out.println("r3 : " + r3);
		
		Box b4 = new Box(); 
		b4.setObj("123");
		//Integer r4 = (Integer) b4.getObj();
		//System.out.println("r4 : " + r4);
		
		List list = new ArrayList(); 
		list.add(10);
		list.add(20);
		list.add(30);
		list.add("40");
		
		for(Object obj : list) {
			Integer r = (Integer) obj; 
			//System.out.println(obj);
			System.out.println("r : " + r);
		
		}
		
		
		
	}

}





