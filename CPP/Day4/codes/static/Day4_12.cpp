#include<iostream> 
using namespace std; 
class Test 
{
    private: 
    int num1; // instance variable  
    int num2; // instance variable  
    int num3; // instance variable  
    public: 
    Test( void ) : num1(0) , num2(0) , num3(500)
    {   }
    Test(int num1 , int num2)
    {
        this->num1 = num1; 
        this->num2 = num2; 
        num3 = 500; 
    }
    void printRecord( void )
    {
        cout<<"num1 : "<<num1<<endl; 
        cout<<"num2 : "<<num2<<endl; 
        cout<<"num3 : "<<num3<<endl; 
    }
}; 
int main()
{
    Test t1(10,20); 
    Test t2(30,40); 
    t1.printRecord( ); 
    t2.printRecord( ); 
    return 0;
}
