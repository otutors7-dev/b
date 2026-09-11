#include<iostream> 
using namespace std; 
class Test 
{
    private: 
    int num1; 
    int num2; 
    int num3; 
    public: 
    Test( void )
    {
        this->num3 = num2; 
        this->num2 = num1; 
        this->num1 = 0; 
    }
    void printRecord( void)
    {
        cout<<"num1 : "<<num1<<endl; 
        cout<<"num2 : "<<num2<<endl; 
        cout<<"num3 : "<<num3<<endl; 
    }

}; 
int main()
{
    Test t1; 
    t1.printRecord( ); 
    return 0;
}
