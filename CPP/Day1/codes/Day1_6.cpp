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
int menuList( void )
{
    int choice; 
    printf("0.Exit\n");
    printf("1.AcceptRecord\n");   
    printf("2.PrintRecord\n");
    printf("Enter the choice : "); 
    scanf("%d",&choice); 
    return choice; 
}
int main()
{
    struct Employee emp; 
    int choice; 
    while((choice = menuList())!=0)
    {
        switch (choice)
        {
        case 1: 
            acceptRecord(&emp); 
            break;
        case 2: 
            printRecord(&emp); 
            break; 
        }
    }
    return 0;
}