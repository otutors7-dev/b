#include<iostream> 
using namespace std; 
class Employee 
{
    private: 
    char name[20]; 
    int age; 
    double salary; 
    public:
    //setter / mutator function 
    void setSalary(double salary)
    {
        this->salary = salary; 
    }
    //getter / inspector 
    int getSalary( void)
    {
        return salary; 
    } 
    void acceptRecord( void )
    {
        cout<<"Name : "; 
        cin>>name; 
        cout<<"Age : "; 
        cin>>age; 
        cout<<"Salary : "; 
        cin>>salary; 
    }
    //facilitator functions 
    void printRecord( void )
    {
        cout<<"Name : "<<name<<endl; 
        cout<<"Age : "<<age<<endl;
        cout<<"Salary : "<<salary<<endl;  
    }
}; 
int main()
{
    Employee emp; 
    emp.acceptRecord( ); 
    //emp.salary = 3000.00; 
    emp.setSalary(3000.00); 
    emp.printRecord( ); 
    cout<<"Updated Salary : "<<emp.getSalary( )<<endl;
    return 0;
}
