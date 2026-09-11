#include<iostream> 
using namespace std; 
//ctor delegation ( calling parameterized from parameterless )
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex( void ) : Complex(10,20) // ctor delegation 
    {
        cout<<"Complex( void )"<<endl; 
    }
    Complex(int real , int imag) //double value parameterized ctor 
    {
        cout<<"Complex(int real , int imag)"<<endl;  
        this->real = real; 
        this->imag = imag; 
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
    Complex c1;
    c1.printRecord( );  
    return 0;
}

