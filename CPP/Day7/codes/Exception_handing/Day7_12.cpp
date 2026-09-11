#include <iostream>
using namespace std;
int main()
{
    
    try
    {
        int *ptr = new int;
        *ptr = 100;
        cout << "*ptr : " << *ptr;
        delete ptr;
        ptr = NULL;
    }
    catch (bad_alloc ex)
    {
        cout<<ex.what( )<<endl; 
    }

    return 0;
}
