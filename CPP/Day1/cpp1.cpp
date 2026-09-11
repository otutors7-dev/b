#include<stdio.h>

int main()
{
    int a = 10; 
    int b = 20; 
    int * const ptr = &a; //constant pointer 
//ptr is a constant pointer pointing to a non constant integer variable     
    printf("a : %d\n",a); //10
    printf("*ptr : %d\n",*ptr); //10 
    a = 20; // OK  
    printf("*ptr : %d\n",*ptr); //20 
    //ptr = &b; // NOT OK 
    return 0;
}