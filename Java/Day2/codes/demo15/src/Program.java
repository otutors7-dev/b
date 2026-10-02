/*
class Person{
	private String name; 
	private int age; 
	//paramterless ctor 
	public Person() {
		this("Aditya",31); // ctor chaining 
		System.out.println("public Person()");
	}
	//parameterized ctor 
	public Person(String name, int age) {
		System.out.println("public Person(String name, int age)");
		this.name = name;
		this.age = age;
	}
	public void printRecord( ) {
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
	}
}
public class Program {

	public static void main(String[] args) {
		Person p = new Person(); //parameterless ctor 
		p.printRecord();
	}

}*/
class Person{
	private String name; 
	private int age; 
	//paramterless ctor 
	public Person() {
		System.out.println("public Person()");
		this.name = "Aditya"; 
		this.age = 31; 
	}
	//parameterized ctor 
	public Person(String name, int age) {
		this();
		System.out.println("public Person(String name, int age)");
	}
	public void printRecord( ) {
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
	}
}
public class Program {

	public static void main(String[] args) {
		Person p = new Person("Rahul", 31); 
		p.printRecord();
	}

}
