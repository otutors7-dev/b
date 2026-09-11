#include<iostream> 
using namespace std; 
class Array
{
    private: 
    int *arr; 
    int size; 
    public: 
    Array(int size)
    {
        this->size = size; 
        this->arr = new int[this->size]; 
        for(int index = 0 ; index < this->size ; index++)
            this->arr[index] = 0; 
    }
    void acceptRecord( void )
    {
        for(int index = 0 ; index < this->size ; index++)
        {
            cout<<"Ele : "; 
            cin>>arr[index]; 
        }
    }
    //this = &a2; 
    //other = a1; 
    Array(const Array &other)
    {
        // Copy the required size from source object into destination object
        this->size = other.size; 
        //Allocate new resource for destination object.
        this->arr = new int[this->size]; 
        //Copy the contents from resource of source object into resource of destination object.
        for(int index = 0 ; index < this->size ; index++)
           this->arr[index] = other.arr[index]; 
    }
    void printRecord( void )
    {
        for(int index = 0 ; index < this->size ; index++)
        {
            cout<<"ele : "<<arr[index]<<endl; 
        }
    }
    ~Array( )
    {
        if(this->arr!=NULL)
        {
            delete[] this->arr; 
            this->arr = NULL; 
        }
    }
}; 
int main()
{
    Array a1(3); 
    a1.acceptRecord( );// 10 20 30 
    Array a2 = a1; 
    a2.printRecord( );  
    return 0;
}
