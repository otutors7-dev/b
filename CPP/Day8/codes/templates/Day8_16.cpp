#include<iostream> 
#include<cstring> 
#define SIZE 3 
using namespace std; 
class Array
{
    private: 
    int arr[SIZE]; 
    public: 
    Array( )
    {
        memset(arr,0,sizeof(arr)); 
    }
    int get(int index)
    {
        return arr[index]; 
    }
    void set(int index , int value)
    {
        arr[index] = value; 
    }
}; 
int main()
{
    Array a1; 
    for(int i = 0 ; i < SIZE ; i++)
    {
        a1.set(i , 1 * i); 
    }
    for(int i = 0 ; i < SIZE ; i++)
    {
        cout<<a1.get(i)<<endl; 
    }
    return 0;
}
