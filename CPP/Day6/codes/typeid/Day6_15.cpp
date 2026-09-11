#include<iostream> 
#include<typeinfo>
using namespace std; 
//RTTI is a process of getting information( data type name ) 
//of any object at runtime.
class Base 
{
    public: 
    virtual ~Base( )
    {   }
}; 
class Derived : public Base 
{

}; 
int main()
{
    Base *ptrBase = NULL;
    cout<<typeid(ptrBase).name()<<endl;
    //cout<<typeid(*ptrBase).name( )<<endl; //bad_typeid exception    
    return 0;
}

int main3()
{
    Base *ptrBase = new Derived( ); 
    cout<<typeid(ptrBase).name()<<endl;
    cout<<typeid(*ptrBase).name( )<<endl;  
    return 0;
}

int main2()
{
    Derived *ptrDervived = new Derived( ); 
    cout<<typeid(ptrDervived).name( )<<endl;  //P7Derived
    cout<<typeid(*ptrDervived).name( )<<endl; //7Derived
    return 0;
}

int main1()
{
    Base *ptrBase = new Base( ); 
    cout<<typeid(ptrBase).name( )<<endl;//P4Base
    cout<<typeid(*ptrBase).name( )<<endl;//4Base 
    return 0;
}

