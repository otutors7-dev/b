#include<iostream> 
using namespace std; 
//ctor delegation ( calling parameterized from parameterless )
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex( void ) 
    {
        cout<<"Complex( void )"<<endl; 
        this->real = 0 ; 
        this->imag = 0; 
    }
    Complex(int real , int imag) : Complex( )
    {
        cout<<"Complex(int real , int imag)"<<endl;  
    }
    void acceptRecord( void )
    {
        cout<<"Real : "; 
        cin>>real; 
        cout<<"Imag : "; 
        cin>>imag; 
    }
    void printRecord( void )
    {
        cout<<"Real : "<<real<<endl;
        cout<<"imag : "<<imag<<endl; 
    }
}; 
int main()
{
    Complex c1(10,20);
    c1.printRecord( );  
    return 0;
}

