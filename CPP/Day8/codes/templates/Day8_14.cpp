#include<iostream> 
using namespace std; 
template<typename T> 
void Swap(T *a , T *b)
{
    T temp; 
    temp = *a; 
    *a = *b; 
    *b = temp; 
}

int main()
{
    int x = 10 , y = 20; 
    Swap<int>(&x,&y); 
    cout<<"x : "<<x<<endl;
    cout<<"y : "<<y<<endl;
    double a = 11.3 , b = 12.3; 
    Swap(&a,&b);  
    cout<<"a : "<<a<<endl;
    cout<<"b : "<<b<<endl;
    return 0;
}
