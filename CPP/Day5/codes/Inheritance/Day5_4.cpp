#include<iostream> 
using namespace std; 
class Person
{
    private: 
    string name; //24 bytes 
    int age; // 4 bytes 
    public: 
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
class Employee 
{
    private: 
    string name;//24  
    int age; //4 
    int empid; //4 
    double salary; //8 
    public: 
    Employee( void ) : name("") , age(0) , empid(0) ,salary(0.0)
    {   }
    Employee(string name , int age , int empid , double salary) : name(name) , age(age) ,empid(empid) , salary(salary)
    {   }
    void displayRecord( void )
    {
        cout<<"Name : "<<name<<endl; 
        cout<<"Age : "<<age<<endl; 
        cout<<"Empid : "<<empid<<endl; 
        cout<<"Salary : "<<salary<<endl; 
    }
}; 
int main()
{
    Employee e; 
    cout<<sizeof(e);    
    return 0;
}

int main1()
{
    Person p; 
    cout<<sizeof(p); //28 bytes 
    return 0;
}
