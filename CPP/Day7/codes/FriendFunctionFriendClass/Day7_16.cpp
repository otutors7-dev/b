#include<iostream> 
using namespace std; 
class A 
{
    public:  
    void sum( ); 
    void sub( ); 
    void multiply( ); 
    void divide( ); 
}; 
class B 
{
    private: 
    int num1; 
    int num2; 
    public: 
    B( void ) : num1(20) , num2(10)
    {   }
    // friend void A :: sum( );  
    // friend void A :: sub( );
    // friend void A :: multiply( );  
    // friend void A :: divide( ); 
     //If we want to access private and protected members of the class inside all of
     //the member functions of another class then we should declare class friend
       friend class A; 
}; 
void A :: sum( )
{
    B obj; 
    int res = obj.num1 + obj.num2; 
    cout<<"Res : "<<res<<endl; 
}
void A :: sub( )
{
    B obj; 
    int res = obj.num1 - obj.num2; 
    cout<<"Res : "<<res<<endl; 
}
void A :: multiply( )
{
    B obj; 
    int res = obj.num1 * obj.num2; 
    cout<<"Res : "<<res<<endl; 
}
void A :: divide( )
{
    B obj; 
    int res = obj.num1 / obj.num2; 
    cout<<"Res : "<<res<<endl; 
}
int main()
{
    A obj; 
    obj.sum( ); 
    obj.sub( ); 
    obj.divide( ); 
    obj.multiply( ); 
    return 0;
}
