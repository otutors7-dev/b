#include<iostream> 
using namespace std;
int main()
{
    int arr[3] = {10,20,30}; 
    int (&ref)[3] = arr; //reference to array 
    for(int index = 0 ; index < 3 ; index++)
        cout<<ref[index]; 
    return 0;
}
 
int main1()
{
    int a = 10; 
    int *p = &a; 
    int *&pp = p; 
    //cout<<*p<<endl;
    //cout<<*pp<<endl; 
    cout<<&a<<endl; 
    cout<<p<<endl;
    cout<<pp<<endl; 
    return 0;
}
