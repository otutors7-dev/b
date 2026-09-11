#include<stdio.h>
int main()
{
    const int a = 10; 
    const int b = 20; 
    const int * const ptr = &a; 
//ptr is a constant pointer pointing to a constant integer variable
    printf("a : %d\n",a); //10 
    printf("b : %d\n",b); //20
    printf("*ptr : %d",*ptr); //10 
    //a = 30; // NOT OK 
    //b = 40; // NOT OK 
    //ptr = &b; // NOT OK   
    return 0;
}

int main3()
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
 
int main2()
{
    const int a = 10; 
    const int b = 20; 
    const int *ptr = &a; 
    printf("a : %d",a); // OK 
    printf("*ptr : %d",*ptr); // OK 
    //a = 20; // NOT OK 
    //*ptr = 30; //  NOT OK 
    ptr = &b; 
    printf("*ptr : %d",*ptr);//20 
    return 0;
}

int main1()
{
    const int a = 10; // we cannot keep constant variable uniintialized 
    printf("a : %d",a); //10 
    //a = 20;// NOT OK  
    return 0;
}

