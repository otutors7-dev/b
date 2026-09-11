#include<iostream> 
using namespace std; 
class A 
{
    public:  
    void sum( ); 
}; 
class B 
{
    private: 
    int num1; 
    int num2; 
    public: 
    B( void ) : num1(20) , num2(10)
    {   }
    friend void A :: sum( );  
}; 
void A :: sum( )
{
    B obj; 
    int res = obj.num1 + obj.num2; 
    cout<<"Res : "<<res<<endl; 
}
int main()
{
    A obj; 
    obj.sum( ); 
    return 0;
}
