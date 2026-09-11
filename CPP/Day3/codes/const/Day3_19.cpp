#include<iostream> 
using namespace std; 
class Test 
{
    private: 
    int num1; 
    int num2; 
    mutable int count; 
    public: 
    Test( void ) : num1(0) , num2(0) , count(0)
    { }
    //classname * const this; 
    // const Test * const this = &t1; 
    void printRecord( void ) const 
    {
        cout<<"num1 : "<<this->num1<<endl;
        cout<<"num2 : "<<this->num2<<endl; 
    }
    //className * const this 
    //Test * const this 
    void showRecord( void ) 
    {
        cout<<"num1 : "<<this->num1<<endl;
        cout<<"num2 : "<<this->num2<<endl; 
    }
    int getCount( void) const  
    {
        return this->count; 
    }
   
}; 
int main()
{
    //Test t1;
    //t1.printRecord( ); 
    //t1.showRecord( );  
    
    const Test t1; 
    t1.printRecord( ); 
    //t1.showRecord( );  
    return 0;
}
