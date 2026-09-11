#include<iostream> 
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
    int *arr; 
    int size; 
    public: 
    Array( int size )
    {
        if(size < 1) 
          throw InvalidArray("Invalid Size"); 
        this->size = size; 
        this->arr = new int[this->size]; 
        for(int index = 0 ; index < size ; index++)
            arr[index] = 0; 
    }
    int get(int index)
    {
        if(index < 0 || index >= this->size)
           throw InvalidArray("Invalid index"); 
        return arr[index]; 
    }
    void set(int index , int value)
    {
        if(index < 0 || index >= this->size)
           throw InvalidArray("Invalid index");
        arr[index] = value; 
    }
    int getSize( void )
    {
        return this->size; 
    }
    void accept( void )
    {
        for(int index = 0 ; index < this->size ; index++)
        {
            cout<<"Ele :" ; 
            cin>>arr[index]; 
        }
    }
    void print( void )
    {
        cout<<"ELE : "; 
        for(int index = 0 ; index < this->size ; index++)
        {
            cout<<arr[index]<<" "; 
        }
        cout<<endl; 
    }
    
    /*
    // this = &a2 
    // other = a1 
    // there is a memory leakage for a2 object 
    void copy(const Array &other)
    {
        this->size = other.size; 
        this->arr = other.arr; 
    }*/ 
    // this = &a2 
    // other = a1 
    void copy(const Array &other)
    {
        //free the old memory 
        delete[] this->arr; 
        // copy the size 
        this->size = other.size; 
        //allocate the memory 
        this->arr = new int[this->size]; 
        //copy the contents 
        for(int index = 0 ; index < size ; index++)
           this->arr[index] = other.arr[index]; 
    } 
    //this : &a3 
    //other : a1 
    void operator=(const Array &other)
    {
        //delete the previous memory 
        delete[] this->arr; 
        //deep copy 
        //copy the size 
        this->size = other.size; 

        //allocate the memory 
        this->arr = new int[this->size]; 

        //copy the contents 
        for(int index = 0 ; index < size ; index++)
           this->arr[index] = other.arr[index]; 
    }
    Array(const Array &other)
    {
        //deep copy 
        //copy the size 
        this->size = other.size; 
        //allocate the memory 
        this->arr = new int[this->size]; 
        //copy the contents 
        for(int index = 0 ; index < this->size ; index++)
           this->arr[index] = other.arr[index]; 
    }
    ~Array()
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
    Array a1(5); 
    a1.accept( ); 
    a1.print( ); 

    Array a2(3); 
    a2.copy(a1); //this : a2 other : a1 
    a2.print( ); 

    Array a3(3); 
    a3 = a1; //a3.operator=(a1); 
    a3.print( ); 
    
    Array a4 = a1; //init
    a4.print( ); 
    return 0;
}
