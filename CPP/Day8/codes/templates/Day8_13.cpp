#include<iostream> 
using namespace std; 
void Swap(int *a , int *b)
{
    int temp; 
    temp = *a; 
    *a = *b; 
    *b = temp; 
}
void Swap(double *a , double *b)
{
    double temp; 
    temp = *a; 
    *a = *b; 
    *b = temp; 
}
int main()
{
    int x = 10 , y = 20; 
    Swap(&x,&y); 
    cout<<"x : "<<x<<endl;
    cout<<"y : "<<y<<endl;
    double a = 11.3 , b = 12.3; 
    Swap(&a,&b);  
    cout<<"a : "<<a<<endl;
    cout<<"b : "<<b<<endl;
    return 0;
}
