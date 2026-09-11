#include<iostream>
using namespace std;

class employee{
    string ename;
    int id;
    double salary;
    string city;
    public:
    void acceptData()
    {
        cout<<"Enter nane of emplyee\n";
        cin>>ename;
        cout<<"Enter ID of employee\n";
        cin>>id;
        cout<<"Enter salary of employee\n";
        cin>>salary;
        cout<<"Enter city of employee\n";
        cin>>city;
        cout<<"------------------------------\n";
    }
    void modifySalary()
    {
        cout<<"\nModify salary to ";
        cin>>salary;
        cout<<"----------------------------------\n";

    }
    void printData()
    {
        cout<<"\nName = "<<ename;
        cout<<"\nID = "<<id;
        cout<<"\nSalary = "<<salary;
        cout<<"\nCity = "<<city;
        cout<<"-------------------------------\n";
    }
};


int main()
{
   employee e1;
   e1.acceptData();
    e1.modifySalary();
    e1.printData();
   //e1.modifySalary();

     employee e2;
   e2.acceptData();
    e2.modifySalary();
    e2.printData();
   return 0;

};