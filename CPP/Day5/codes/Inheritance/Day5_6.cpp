#include<iostream> 
using namespace std; 
class Person // Base class -- parent class 
{
    private: 
    string name; //24 bytes 
    int age; // 4 bytes 
    public: 
    static int num;  
    Person(void) : name("") ,age(0)
    {   }
    Person(string name , int age) : name(name) , age(age)
    {   }
    void printRecord( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Age : "<<age<<endl; 
    }
};
int Person :: num = 100; 
class Employee : public Person // Derived class - child class   
{
    private: 
    //string name;//24  
    //int age; //4 
    int empid; //4 
    double salary; //8 
    public: 
    Employee( void ) : empid(0) ,salary(0.0)
    {   }
    Employee(string name , int age , int empid , double salary) : empid(empid) , salary(salary)
    {   }
    void displayRecord( void )
    {
        cout<<"Empid : "<<empid<<endl; 
        cout<<"Salary : "<<salary<<endl; 
    }
}; 
//Using derived class, 
//we can access static members of base class. 
//In other words, 
//static data members of base class, inherit into derived class. 
int main()
{
    //cout<<Person::num<<endl; // OK 
    cout<<Employee::num<<endl; // OK 
}


