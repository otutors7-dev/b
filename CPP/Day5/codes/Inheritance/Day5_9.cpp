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
    {   
        cout<<"Person(void)"<<endl; 
    }
    Person(string name , int age) : name(name) , age(age)
    {  
        cout<<"Person(string name , int age) "<<endl; 
     }
    void printRecord( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Age : "<<age<<endl; 
    }
    ~Person( )
    {
        cout<<"~Person( )"<<endl; 
    }
};
class Employee : public Person // Derived class - child class   
{
    private: 
    int empid; //4 
    double salary; //8 
    public: 
    Employee( void ) : empid(0) ,salary(0.0)
    {   
        cout<<"Employee( void )"<<endl; 
    }
    Employee(string name , int age , int empid , double salary) : empid(empid) , salary(salary) , Person(name , age)
    {   
        cout<<"Employee(string name , int age , int empid , double salary)"<<endl; 
    }
    void displayRecord( void )
    {
        cout<<"Empid : "<<empid<<endl; 
        cout<<"Salary : "<<salary<<endl; 
    }
    ~Employee( )
    {
        cout<<"~Employee( )"<<endl; 
    }
}; 
//If we want to call, 
//any constructor of base class from constructor of derived class then we 
//should use constructor's base initializer list. 
int main()
{
    //Employee e; 
    Employee e("Nilesh",31,1,1000.00); 
    return 0;
}

int main1()
{
    //Person p; 
    Person p("Sandeep",31); 
    return 0; 
}


