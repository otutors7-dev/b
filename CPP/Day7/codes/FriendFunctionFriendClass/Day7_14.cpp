#include<iostream> 
using namespace std; 
class Test 
{
    private: 
    int num1; 
    protected: 
    int num2;
    public: 
    Test( void ) : num1(10) , num2(20)
    {   } 
    friend void print( ); 
    
}; 
void print( ) // Global function 
{    
    Test t1; 
    cout<<t1.num1<<endl;
    cout<<t1.num2<<endl; 
}
int main()
{
    ::print( );    
    return 0;
}
