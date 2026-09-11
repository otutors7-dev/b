#include<iostream> 
#define SIZE 3 
using namespace std;
class InvalidArray
{
    private: 
    string message; 
    public: 
    InvalidArray(string message)
    {
        this->message = message; 
    }
    string getMessage( void )
    {
        return this->message; 
    }
}; 
class Array
{
    private: 
    int arr[SIZE]; 
    public: 
    Array( void )
    {
        arr[0] = 10; 
        arr[1] = 20; 
        arr[2] = 30; 
    }
    int& operator[](int index)
    {
        if(index < 0 || index >= SIZE)
          throw InvalidArray("Invalid index"); 
        return arr[index]; 
    }
}; 
int main()
{
    Array a1; 
    //int element = a1[0]; //a1.operator[](0)
    a1[0] = 300; //a1.operator[](0) = 300 
    cout<<"ele : " <<a1[0]; 
    return 0;
}
 