#include <iostream>
using namespace std;
namespace ntest
{
    class Employee
    {
    private:
        char name[20];
        int age;
        double salary;

    public:
        // declarations
        void acceptRecord(void);
        void printRecord(void);
    };
}
using namespace ntest; 
// definations
void Employee ::acceptRecord(void)
{
    cout << "Name : ";
    cin >> name;
    cout << "Age : ";
    cin >> age;
    cout << "Salary : ";
    cin >> salary;
}
void Employee::printRecord(void)
{
    cout << "Name : " << name << endl;
    cout << "Age : " << age << endl;
    cout << "Salary : " << salary << endl;
}
int main()
{
    Employee emp;
    emp.acceptRecord();
    emp.printRecord();
    return 0;
}
