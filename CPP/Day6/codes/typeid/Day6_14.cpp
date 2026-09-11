#include<iostream> 
#include<typeinfo>
using namespace std; 
//RTTI is a process of getting information( data type name ) 
//of any object at runtime.
class Base 
{

}; 
class Derived : public Base 
{

}; 
int main3()
{
    Derived derived; 
    cout<<"Type : "<<typeid(derived).name( ); 
    return 0;
}

int main2()
{
    Base base; 
    cout<<"Type : "<<typeid(base).name( )<<endl; 
    return 0;
}

int main1()
{
    int i; 
    //const type_info& type  = typeid(i); 
    //cout<<"Type : "<<type.name( ); 
    cout<<"Type : "<<typeid(i).name( )<<endl; 
    return 0;
}
