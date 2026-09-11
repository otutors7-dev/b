#include<iostream> 
#include<cstring> 
#define SIZE 3 
using namespace std; 
template<typename T> 
class Array
{
    private: 
    T arr[SIZE]; 
    public: 
    Array( )
    {
        memset(arr,0,sizeof(arr)); 
    }
    T get(int index)
    {
        return arr[index]; 
    }
    void set(int index , T value)
    {
        arr[index] = value; 
    }
}; 
int main()
{
    //Array<int> a1; 
    Array<double> a1; 
    for(int i = 0 ; i < SIZE ; i++)
    {
        a1.set(i , 1.1 * i); 
    }
    for(int i = 0 ; i < SIZE ; i++)
    {
        cout<<a1.get(i)<<endl; 
    }
    return 0;
}
