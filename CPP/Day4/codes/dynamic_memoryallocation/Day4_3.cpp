#include <iostream>
using namespace std;
int main2()
{
    int *ptr = new(nothrow)int;
    if(ptr!=NULL)
    {
        *ptr = 200; 
        cout<<"value : "<<*ptr<<endl; 
        delete ptr; 
        ptr = NULL; 
    } 
    return 0;
}

int main()
{
    try
    {
        int count = -1; 
        int *ptr = new int[count];
        *ptr = 200;
        cout << "value " << *ptr << endl;
        delete ptr;
        ptr = NULL;
    }
    catch (bad_alloc ex)
    {
        cout<<ex.what( )<<endl; 
    }

    return 0;
}

int main1()
{
    int *ptr1 = new int; // Garbage
    delete ptr1;
    ptr1 = NULL;

    int *ptr2 = new int(); // by default 0
    delete ptr2;
    ptr2 = NULL;

    int *ptr3 = new int(10); // by default it contains 10
    delete ptr3;
    ptr3 = NULL;
    return 0;
}
