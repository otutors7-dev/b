package com.karad;

import com.hinjewadi.A;

public class E {
  public void display( ) {
	  A obj = new A( );
	  //System.out.println(obj.a); // NOT OK -- private 
	  System.out.println(obj.b); // OK -- public 
	  //System.out.println(obj.c); // NOT OK -- protected 
	  //System.out.println(obj.d); // NOT OK -- default
  }
}
