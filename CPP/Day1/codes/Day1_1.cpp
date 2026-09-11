#include<stdio.h> 
//job of main function is to call other function 
//main is a user-defined funtion 
//per-project we can define only one main function 
//program execution starts from main 
//we cannot declare main as static / const 
// main should be global we cannot define main inside the structure / class 
//OS calls main function 
//if we dont write main and compile then it will give linker error  
//void print( void); //Global function declaration 
int main( void )
{
    void print( void); //local function declaration 
    print( ); //function call 
    return 0;
}
void print( void )// function defination 
{
    printf("Hello world"); 
}
