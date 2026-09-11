#include<iostream> 
using namespace std; 
//Number of parameters 
void add(int a , int b) //2 parameters 
{
    int result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
void add(int a , int b , int c) //3 parameters 
{
    int result = a + b + c; 
    cout<<"Result : "<<result<<endl; 
}
int main()
{
    ::add(10,20);
    ::add(10,20,30);  
    return 0;
}
