#include <stdio.h>
struct Employee // Global structure
{
    private: 
    char name[20];
    int age;
    double salary;
    public: 
    void acceptRecord(/*struct Employee *ptr*/)
    {
        printf("Name : ");
        scanf("%s", name);
        printf("Age : ");
        scanf("%d", &age);
        printf("Salary : ");
        scanf("%lf", &salary);
    }
    void printRecord(/*struct Employee *ptr*/)
    {
        printf("Name : %s\n", name);
        printf("Age : %d\n", age);
        printf("Salary : %.2lf\n", salary);
    }
};
// Global function

int main()
{
    Employee emp;
    emp.acceptRecord(); //emp.acceptRecord(&emp);
    //emp.salary = 0.0;
    emp.printRecord(); //emp.printRecord(&emp);
    return 0;
}