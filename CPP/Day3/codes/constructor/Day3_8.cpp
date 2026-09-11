#include<iostream> 
using namespace std; 
//Types of constructor 

/*If we dont write any ctor inside the class 
then compiler generate 
one ctor by default it is called default ctor 
(compiler defined ctor)
*/ 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex(int real , int imag) //double value parameterized ctor 
    {
        cout<<"Complex(int value)"<<endl;  
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
    //Complex c1; // no ctor 
    Complex c1(10,20); 
    return 0;
}

