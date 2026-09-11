#include <iostream>
using namespace std;
class Person // Base class -- parent class
{
private:
    string name; // 24 bytes
    int age;     // 4 bytes
public:
    static int num;
    Person(void) : name(""), age(0)
    {
    }
    Person(string name, int age) : name(name), age(age)
    {
    }
    void printRecord(void)
    {
        cout << "Name : " << name << endl;
        cout << "Age : " << age << endl;
    }
};
//Without changing implementation of existing class, 
//if we want to extend meaning of that class then 
//we should use inheritance.
class Employee : public Person // Derived class - child class
{
private:
    int empid;     // 4
    double salary; // 8
public:
    Employee(void) : empid(0), salary(0.0)
    {
    }
    Employee(string name, int age, int empid, double salary) : empid(empid), salary(salary), Person(name, age)
    {
    }
//If implementation of base class member function is logically 
//incomplete then we should redefine 
//member function inside derived class. 
//In other words, we should give same name to the member 
//function in derived class. 
    void printRecord(void)
    {
        //this->Person::printRecord( ); 
        Person::printRecord( ); 
        cout << "Empid : " << empid << endl;
        cout << "Salary : " << salary << endl;
    }
};
//If name of base class and derived class member function 
//is same and if we try to call such member 
//function on object of derived class then preference 
//is given to the derived class member function. 
//Here derived class member function hides implementation 
//of inherited function. This process is called    shadowing. 
int main()
{
    Employee e("Nilesh",31,1,1000.00);
    e.printRecord( ); //Employee::printRecord( ); 
    return 0;
}
