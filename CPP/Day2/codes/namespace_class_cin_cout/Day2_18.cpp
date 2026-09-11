#include<iostream> 
using namespace std; 
class Employee 
{
    private: 
    char name[20]; 
    int age; 
    double salary; 
    public: 
    void acceptRecord( void )
    {
        cout<<"Name : "; 
        cin>>name; 
        cout<<"Age : "; 
        cin>>age; 
        cout<<"Salary : "; 
        cin>>salary; 
    }
    void printRecord( void)
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
    emp.printRecord( ); 
    return 0;
}
