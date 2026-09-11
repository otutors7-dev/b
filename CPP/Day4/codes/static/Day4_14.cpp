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
    void setNum1(int num1)
    {
        this->num1 = num1; 
    }
    void setNum2(int num2)
    {
        this->num2 = num2; 
    }
    static void setNum3(int num3)  
    {
         Test :: num3 = num3; 
    }
    static int getNum3( void )
    {
         return Test :: num3; 
    }
    int getNum1( void)
    {
        return this->num1; 
    }
    int getNum2( void )
    {
        return this->num2; 
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
    t1.printRecord( ); // 10 20 500 
    Test t2(30,40); 
    t2.printRecord( ); // 30 40 500 
    //Test::num3 = 1000; 
    Test::setNum3(1000); 
    t1.printRecord( );// 10 20 1000  
    t2.printRecord( );// 30 40 1000  
    //cout<<"num3 : "<<Test::num3; 
    cout<<"num3 : "<<Test::getNum3( ); 
    return 0;
}
