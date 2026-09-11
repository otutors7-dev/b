#include<iostream> 
using namespace std; 
void sum(int a , int b)
{
    int result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
void add(int a , float b)
{
    float result = a + b; 
    cout<<"Result : "<<result<<endl; 
}
int main()
{
    ::sum(10,20); 
    ::add(10,1.1f); 
    return 0;
}
