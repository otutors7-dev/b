#include<iostream> 
using namespace std; 
//ctor cannot be const 
//we cannot declare global function const , 
//class cannot const 
//local pointer and global pointer can be made const 
//data-member can be const 
//member funtion  can be const 
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
        //++this->num1; 
        //++this->num2; 
        cout<<"num1 : "<<this->num1<<endl;
        cout<<"num2 : "<<this->num2<<endl; 
    }
    //className * const this 
    // const Test * const this 
    void showRecord( void ) const 
    {
        //++this->num1; 
        //++this->num2; 
        ++this->count; 
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
    Test t1; 
    t1.showRecord( );
    t1.showRecord( ); 
    t1.showRecord( ); 
    cout<<"Count : "<<t1.getCount( )<<endl; 
    return 0;
}
