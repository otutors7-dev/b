## demo02 - Java 8 Interfaces
* interface Printable - show() //multiple interface inheritance will not lead to any ambiguity error
			       // because interfaces doesn't contain any definitions
* interface Displayable - show()
* Java 7 Interfaces - No ambiguity


* Default methods - Ambiguity 
// compiler error: duplicate show() method in FirstClass.
// if two interfaces have default method with same signature and a class is inherited from that interface,
//then it will lead to ambiguity.



* No ambiguity - After overriding method
// if two interfaces have default method with same signature and a class is inherited from that interface,
//	then it will lead to ambiguity.
// this problem can be resolved by overriding method in sub-class.



* Super class wins Super-interfaces clash! (no override) 
    * class Printable, interface Displayable
// when same signature method is inherited from a super-class
// and a super-interface, the super-class method gets precedance.
// no compiler error for ambiguity



* Method overriding above example 
// method overrriding -- method is called depending on type of object.






## demo03 - Lambda Expression
* Sort array using Comparator
    ```Java
    Employee[] arr = new Employee[] {
        new Employee(4, "B", "Clerk", "Sales", 723.44),
        new Employee(8, "X", "Manager", "Accounts", 823.23),
        new Employee(2, "P", "Clerk", "Research", 234.23),
        new Employee(9, "N", "Manger", "Sales", 252.53),
        new Employee(5, "D", "Clerk", "Accounts", 923.23),
        new Employee(1, "Q", "Analyst", "Research", 826.23),
        new Employee(7, "H", "Clerk", "Research", 845.24),
        new Employee(6, "A", "Analyst", "Research", 832.23),
        new Employee(3, "G", "Analyst", "Sales", 952.44)
    };
    ```
*EmployeeIdComparator  -- local class
*Employees sort by name ---- Anonymous Inner class
*Empolyees sort by Job : Anonymous Inner class Anonymous object 
*Empolyees sort by Job desc    // lambda is short-hand implementation of the abstract method in the functional interface
*Empolyees sort by name desc (type inference) 
*Empolyees sort by sal Asc
*Empolyees sort by sal desc  // Single abstract method -> arguments -> one-liner implementation of functional Interface 
// single liner lambda expression doesn't need curly brace
// and the result of expression is considered to be returned.

*Emps list sorted by id in desc order:

**  Arrays.asList(arr); 

* Predifined Funtional Interfaces in java (Theory)



* use BinaryOperator<Integer> op1; 
*lambda expressions are referenced by functional interface reference.
*lambda arg scope is limited to lambda expression body/implementation.
*non-capturing lambda
*capturing lambda -- (are also called closure in some programming languages) 

*// capturing lambda - captures (attach) a variable out-side the lambda implementation.
// can capture variables that are final or effectively final.





## demo04 - Lambda expressions
A Stream in Java is a sequence of elements (data) that can be processed in a functional style.
It is not a data structure but a view of data from collections, arrays, or I/O channels.
## demo05 - Java Streams
		//Input : 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 
		//step1 : Square of each number : 1 , 4 , 9 , 16 , 25 , 36 , 49 , 64 , 81 , 100 
		//step2 : get all odd numbers : 1 , 9 , 25 , 49 , 81 
		//step3 : append "java" :  "java1" , "java9" , "java25" , "java49" , "java81"
		// print each element 
		
		

* Stream operations
    * of()
    * filter()
    * map()
    * sorted()
    * map()
    * forEach()
* Stream execution

## stream basic operation refer notes 

* `Stream<Double>`//Arrays.stream(); 
    * skip()
    * limit()
* `Stream<String>`//list.stream(); 
list.add("A sequence of elements supporting sequential and parallel aggregate operations.");
list.add("In addition to Stream, which is a stream of object references, there are primitive specializations for IntStream.");
list.add("To perform a computation, stream operations are composed into a stream pipeline.");	
    * map(lowercase) 
   
    
* `Stream<Integer>`
    * reduce() ( use Set ( TreeSet) ,set.stream() ) (Collections.addAll) ( convert set to Stream first and then use reduce)
    
* `Stream<Integer> strm = Stream.iterate(); 
    * print table of number
*  collect in a list(Collectors.tolist) 
*  collect (distinct) in a set

* Stream of primitive values
    *// primitive streams are more efficient -- because no boxing/unboxing done for each arithmetic	
   



//For every class you write in Java, the JVM automatically creates a single java.lang.Class object that represents that class.
## demo04 - Reflection
*// get class metadata -- java.lang.Class object
// String className; --> c = Class.forName(className);
* inspect metadata(Class.forName(className))





