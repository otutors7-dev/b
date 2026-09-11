#include<iostream> 
using namespace std; 
void fun( )
{
    static int num1 = 10; //function scope 
    num1++; 
    cout<<"num1 : "<<num1<<endl; 
}
int main()
{
    fun( );
    fun( ); 
    fun( );
    return 0;
}
/*
void fun( )
{
    int num1 = 10; 
    num1++; 
    cout<<"num1 : "<<num1<<endl; 
}
int main()
{
    fun( );
    fun( ); 
    fun( );
    return 0;
}*/ 
