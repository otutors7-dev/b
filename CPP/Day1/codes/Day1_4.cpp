#include<stdio.h> 
struct Employee  //Global structure 
{
    char name[20]; 
    int age; 
    double salary; 
}; 
int main1(void);
int main()
{
    // struct Employee emp;    
    // printf("Name : "); 
    // scanf("%s",emp.name); 
    // printf("Age : "); 
    // scanf("%d",&emp.age); 
    // printf("Salary : "); 
    // scanf("%lf",&emp.salary); 
    // printf("Name : %s\n",emp.name);
    // printf("Age : %d\n",emp.age);
    // printf("Salary : %.2lf\n",emp.salary);
    main1();

    return 0;
}

int main1()
{
    //blueprint 
    struct Employee  //local structure 
    {
        char name[20]; 
        int age; 
        double salary; 
    }; 
    // int x = 10;
    struct Employee emp = {"Sandeep",31,1000.00}; 
    printf("Name : %s\n",emp.name);
    printf("Age : %d\n",emp.age);
    printf("Salary : %.2lf\n",emp.salary);

    return 0;
}
