#include<iostream>
#include<fstream> 
#include<sstream>
using namespace std; 
class Employee
{
    private: 
    int empid; 
    string name; 
    double salary; 
    public: 
    Employee( void ) : empid(0) , name("") , salary(0.0)
    {   }
    Employee(int empid , string name , double salary) : empid(empid) , name(name) , salary(salary)
    {   }
    void accept( void )
    {
        cout<<"Empid : "; 
        cin>>empid; 
        cout<<"Name : "; 
        cin>>name; 
        cout<<"Salary : "; 
        cin>>salary;  
    }
    void display( void )
    {
        cout<<"Id : "<<empid<<endl;
        cout<<"Name: "<<name<<endl;
        cout<<"Salary : "<<salary<<endl; 
    }
    int getId( void )
    {
        return this->empid; 
    }
    string getName( void )
    {
        return this->name; 
    }
    double getSalary( void )
    {
        return this->salary; 
    }
};
void write( void)
{
    ofstream fout("File2.txt"); 
    Employee e; 
    e.accept( ); 
    fout<<e.getId( )<<","<<e.getName()<<","<<e.getSalary()<<endl; 
    fout.close( ); 
}
void read( void )
{
    ifstream fin("File2.txt"); 
    string line; 
    while(getline(fin,line))
    {
        stringstream data(line); //"1,Rahul,2000"
        string id , name , salary; 
        getline(data,id,',');  //"id"
        getline(data,name,',');//"name" 
        getline(data,salary,',');//"salary"; 
        Employee e(stoi(id),name,stod(salary)); 
        e.display( );  
    }
    fin.close();  
}
int main()
{
    //write( ); 
    read( ); 
    return 0;
}
