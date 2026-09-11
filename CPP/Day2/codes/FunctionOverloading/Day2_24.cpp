#include<iostream> 
using namespace std; 
//Order of parameters 
void add(int a , float b) //2 parameters ( i , f)
{
    float result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
void add(float a , int b) //2 parameters ( f , i) 
{
    float result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
int main()
{
    ::add(10,20.1f);
    ::add(10.1f,20);  
    return 0;
}
