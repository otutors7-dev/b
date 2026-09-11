#include<stdio.h> 
int main()
{
    int a = 10; 
    const int *ptr = &a; 
    printf("a : %d",a);// OK 
    printf("*ptr : %d",*ptr);//OK 
    a = 20;  
    printf("a : %d",a);// OK 
    printf("*ptr : %d",*ptr);//OK 
    //*ptr = 30; 
    return 0;
}

int main1()
{
    const int a = 10; 
    int *ptr = &a; 
    printf("a : %d\n",a); //10 
    printf("*ptr : %d\n",*ptr); //10
    //a = 20; // NOT OK 
    *ptr = 20;  
    printf("a : %d\n",a); //20 
    
    return 0;
}
