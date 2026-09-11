#include<iostream> 
using namespace std; 
class Test 
{
    private: 
    const int num; 
    public: 
    Test( void ) : num(0)
    {
        //this->num = 0; 
    }
}; 
int main()
{
    Test t1; 
    return 0;
}
