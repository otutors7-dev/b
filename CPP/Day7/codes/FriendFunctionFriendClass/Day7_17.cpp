#include<iostream> 
using namespace std; 
class A 
{
    private: 
    int num1; 
    public: 
    A(void ) : num1(10)
    {   }
    void showRecord( ); 
    friend class B; 
}; 
class B 
{
    private: 
    int num2; 
    public: 
    B( void ): num2(20)
    {   }
    void printRecord( );
    friend class A;  
}; 
void A :: showRecord( )
{
    B obj; 
    cout<<"num2 : "<<obj.num2<<endl; 
}
void B :: printRecord( ) 
{
    A obj; 
    cout<<"num1 : "<<obj.num1<<endl; 
}
int main()
{
    A a; 
    a.showRecord( ); 
    B b; 
    b.printRecord( ); 
    return 0;
}
