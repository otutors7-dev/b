#include<iostream> 
using namespace std; 
void add(int a = 0 , int b = 0 , int c = 0, int d = 0 , int e = 0 ) 
{
    // int result = a + b + c + d + e; 
    // cout<<"result : "<<result<<endl; 
}
int main()
{
    ::add(10,20,30,40,50); 
    //::add(10,20,30,40); 
    //::add(10,20,30); 
    //::add(10,20); 
    //::add(10); 
    //::add(); 
    return 0;
}
