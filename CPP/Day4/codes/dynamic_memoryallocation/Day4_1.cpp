#include<iostream> 
using namespace std;
int main()
{
    int *ptr = new int[3]; //12 bytes 
    ptr[0] = 10;
    ptr[1] = 20; 
    ptr[2] = 30;
    for(int index = 0 ; index < 3 ; index++)
        cout<<ptr[index]<<endl; 
    delete[] ptr; // to avoid memory leakage 
    ptr = NULL;  // to avoid dangling pointer 
    return 0;
}
 
int main1()
{
    int *ptr = new int; // 4 bytes 
    *ptr = 200; 
    cout<<"Value : "<<*ptr; 
    delete ptr;  // to avoid memory leakage 
    ptr = NULL; // to avoid dangling pointer 
    return 0;
}
