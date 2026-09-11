#include <stdio.h>
int a; //global variable 
class Employee // Global structure
{
    private:
    //data-members / fields / properties / attributes  
    char name[20];
    int age;
    double salary;
    public: 
    //member-functions / methods / operation / behaviour 
    void acceptRecord()
    {
        printf("Name : ");
        scanf("%s", name);
        printf("Age : ");
        scanf("%d", &age);
        printf("Salary : ");
        scanf("%lf", &salary);
    }
    void printRecord(/*int c*/) // functon pararameter 
    {
        printf("Name : %s\n", name);
        printf("Age : %d\n", age);
        printf("Salary : %.2lf\n", salary);
    }
};
// Global function

int main()
{
    //int b; //local variable  
    Employee emp; // Object 
    //class Employee emp; // Object 
    //emp.acceptRecord(); //message passing emp.acceptRecord(&emp);
    emp.Employee::acceptRecord( );//message passing  
    //emp.salary = 0.0;
    //emp.printRecord(); //message passing emp.printRecord(&emp);
    emp.Employee::printRecord( ); //message passing 
    return 0;
}