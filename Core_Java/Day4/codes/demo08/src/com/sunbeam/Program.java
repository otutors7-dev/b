package com.sunbeam;

//If "has-a" relationship exist between the types, then use association.

//To implement association, 
//we should declare instance/collection of inner class as a field inside
//another class.

/*
Composition
* Represents part-of relation i.e. tight coupling between the objects.
* The inner object is essential part of outer object.
    * Engine is part of Car.
    * Wall is part of ClassRoom
*/

/*
Aggregation
* Represents has-a relation i.e. loose coupling between the objects.
* The inner object can be added, removed, or replaced easily in outer object.
    * Car has a Driver.
    * Company has Employees.
*/ 
public class Program {

	public static void main(String[] args) {
		//Date dt1 = new Date(); 
		//dt1.display();
		
		//Date dt2 = new Date(1, 1, 2020);
		
		//Emp e = new Emp(1, "Aditya", 1000.00, dt2); 
		//e.display();
		
		Emp e = new Emp(); 
		e.accept();
		e.display();
	}

}





