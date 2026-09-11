#include<iostream> 
using namespace std; 
class Date
{
    private: 
    int day; 
    int month; 
    int year; 
    public: 
    Date( void ) : day(0) , month( 0 ) , year(0)
    {   }
    Date(int day , int month , int year)  : day(day) , month(month) , year(year)
    {   }
    void acceptDate( void )
    {
        cout<<"Day : "; 
        cin>>day; 
        cout<<"Month : "; 
        cin>>month; 
        cout<<"Year : "; 
        cin>>year; 
    }
    void printDate( void )
    {
        cout<<day<<"/"<<month<<"/"<<year<<endl; 
    }
}; 
class Employee 
{
    private: 
    string name; 
    int empid; 
    double salary; 
    Date joinDate; //Association 
    public: 
    Employee( void ) : name("") , empid(0) , salary(0.0)
    {   }
    Employee(string name , int empid , double salary) : name(name) , empid(empid) , salary(salary)
    {   }
    Employee(string name , int empid , double salary , Date joinDate)  : name(name) , empid(empid) , salary(salary) , joinDate(joinDate)
    {   }
    Employee(string name , int empid , double salary , int day , int month , int year) : name(name) , empid(empid) , salary(salary) , joinDate(day,month,year)
    {   }
    void accept( void )
    {
        cout<<"Name : "; 
        cin>>name; 
        cout<<"Empid : "; 
        cin>>empid; 
        cout<<"Salary : ";
        cin>>salary; 
        this->joinDate.acceptDate( ); 
    }
    void print( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Empid : "<<empid<<endl; 
        cout<<"Salary : "<<salary<<endl; 
        cout<<"JoinDate : ";
        this->joinDate.printDate( );   
    }
}; 
int main()
{
    Employee e; 
    e.accept( ); 
    e.print( ); 
    return 0;
}

int main2()
{
    Employee e("Nilesh",1,1000,1,1,2000); 
    e.print( ); 
    return 0;
}

int main1()
{
    Date dt1(1,1,2000); 
    Employee e("Sandeep",1,1000.00,dt1); 
    e.print( ); 
    return 0;
}
