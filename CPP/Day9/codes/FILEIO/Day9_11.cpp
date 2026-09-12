#include<iostream> 
#include<sstream>
#include<fstream>
#include<vector>
using namespace std; 

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
int menu()
{
    cout << "***************************" << endl;
    int choice;
    cout << "0. EXIT" << endl;
    cout << "1. Add Employee" << endl;
    cout << "2. Display All Employees" << endl;
    cout << "3. Find Employee" << endl;
    cout << "4. Delete Employee" << endl;
    cout << "Enter your choice - ";
    cin >> choice;
    cout << "***************************" << endl;
    return choice;
}
void loadEmployees(vector<Employee*> &emp_list)
{
    ifstream fin("File2.txt"); 
    string line; 
    while(getline(fin,line))
    {
        stringstream data(line); 
        string id , name , salary; 
        getline(data,id,','); // id 
        getline(data,name,',');// name 
        getline(data,salary,',');//salary 
        emp_list.push_back(new Employee(stoi(id),name,stod(salary))); 
    }
    fin.close( ); 
}
int findEmployee(vector<Employee*> &emp_list) 
{
    int id; 
    cout<<"Enter the id : "; 
    cin>>id; 
    for(int i = 0 ; i < emp_list.size( ) ; i++)
    {
        if(id == emp_list[i]->getId( ))
        {
            return i; 
        }
    }
    return -1; 
}
void saveEmployees(vector<Employee*> &emp_list)
{
    ofstream fout("File2.txt"); 
    for(int i = 0 ; i < emp_list.size( ) ; i++)
    {
        Employee *emp = emp_list[i]; 
        fout<<emp->getId( )<<","<<emp->getName()<<","<<emp->getSalary()<<endl; 
    }
    fout.close( ); 
}
int main()
{
    int choice; 
    vector<Employee*>emp_list; 
    loadEmployees(emp_list);
    while((choice = ::menu())!=0)
    {
        switch (choice)
        {
        case 1: 
            {
                Employee *employee = new Employee( ); 
                employee->accept( ); 
                emp_list.push_back(employee); 
            }
            break;
        case 2:
        for(int i = 0 ; i < emp_list.size( ) ; i++)
        {
            emp_list[i]->display( ); 
        } 
        break; 
        case 3: 
        {
            int index = findEmployee(emp_list);  
            if(index!=-1)
            {
                emp_list[index]->display( ); 
            }
            else 
              cout<<"Not found"<<endl; 
        }
        break; 
        case 4: 
        {
            int index = findEmployee(emp_list); 
            if(index!=-1)
            {
                delete emp_list[index]; 
                emp_list.erase(emp_list.begin( ) + index); 
            }
        }
        break; 
        default:
            break;
        }
    }
    saveEmployees(emp_list); 
    return 0;
}
