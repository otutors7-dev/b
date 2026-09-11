#include<iostream> 
using namespace std; 
//Type of parameters 
void add(int a , int b) //2 parameters ( i , i)
{
    int result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
void add(int a , float b) //2 parameters ( i , f) 
{
    float result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
int main()
{
    ::add(10,20);
    ::add(10,20.1f);  
    return 0;
}
