#include<iostream> 
using namespace std; 
template<typename T> 
void Swap(T *a , T *b)
{
    T temp; 
    temp = *a; 
    *a = *b; 
    *b = temp; 
}
class Employee 
{
    private: 
    string name; 
    int empid; 
    double salary; 
    public: 
    Employee(void ) : name("") , empid(0) , salary(0.0)
    {   }
    Employee(string name , int empid , double salary) : name(name) , empid(empid) , salary(salary)
    {   }
    void printRecord( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Empid : "<<empid<<endl; 
        cout<<"Salary : "<<salary<<endl;
    }
}; 
int main()
{
    Employee e1("A",1,1000.00); 
    Employee e2("B",2,2000.00); 
    e1.printRecord( ); 
    e2.printRecord( ); 
    Swap(&e1,&e2);
    e1.printRecord( ); 
    e2.printRecord( );  
    return 0;
}
