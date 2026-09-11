#include<stdio.h> 
struct Employee  //Global structure 
{
    char name[20]; 
    int age; 
    double salary; 
};
//Global function  
void acceptRecord( struct Employee *ptr )
{
    printf("Name : "); 
    scanf("%s",ptr->name); 
    printf("Age : "); 
    scanf("%d",&ptr->age);
    printf("Salary : "); 
    scanf("%lf",&ptr->salary);  
}
void printRecord( struct Employee *ptr )
{
    printf("Name : %s\n",ptr->name); 
    printf("Age : %d\n",ptr->age);
    printf("Salary : %.2lf\n",ptr->salary);
}
int main()
{
    struct Employee emp;    
    acceptRecord(&emp); 
    printRecord(&emp);  
    return 0;
}