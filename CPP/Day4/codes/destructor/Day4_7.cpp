#include<iostream> 
using namespace std; 
class Array
{
    private: 
    int size; 
    int *arr; 
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
            cout<<"Element : "; 
            cin>>arr[index]; 
        }
    }
    void printRecord( void )
    {
        for(int index = 0 ; index < this->size ; index++)
        {
            cout<<"Ele : "<<arr[index]<<endl; 
        }
    }
    ~Array(  )// destructor 
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
    a1.acceptRecord( ); 
    a1.printRecord( ); 
     
    return 0;
}
