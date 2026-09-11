#include<iostream> 
using namespace std; 
//A non member function of the class, 
//which is designed to access private and
//protected members of the class is called friend function of the class.
class Test 
{
    private: 
    int num1; 
    protected: 
    int num2;
    public: 
    Test( void ) : num1(10) , num2(20)
    {   } 
    friend int main(); 
}; 
int main()
{
    Test t1; 
    cout<<t1.num1<<endl;
    cout<<t1.num2<<endl; 
    return 0;
}
