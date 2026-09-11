#include<iostream> 
using namespace std; 
//If we want to share value of any data member inside all the objects of same class then we should declare 
//data member static
class Test 
{
    private: 
    int num1; // instance variable  
    int num2; // instance variable  
    static int num3; // classlevel Variable 
    public: 
    Test( void ) : num1(0) , num2(0)
    {   }
    Test(int num1 , int num2)
    {
        this->num1 = num1; 
        this->num2 = num2; 
    }
    void printRecord( void )
    {
        cout<<"num1 : "<<num1<<endl; 
        cout<<"num2 : "<<num2<<endl; 
        cout<<"num3 : "<<Test :: num3<<endl; 
    }
}; 
int Test :: num3 = 500; // Global defination 
int main()
{
    Test t1(10,20); 
    Test t2(30,40); 
    t1.printRecord( ); 
    t2.printRecord( ); 
    return 0;
}
