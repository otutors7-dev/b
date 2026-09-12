#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex( void ) : real(0) , imag(0)
    {   }
    Complex(int real, int imag) : real(real) , imag(imag)
    {   }
    //conversion function 
    Complex(int value)
    {
        cout<<" Complex(int value)"<<endl; 
        this->real = value; 
        this->imag = value; 
    }
    // void operator=(int value)
    // {
    //     cout<<"void operator=(int value)"<<endl; 
    //     this->real = value; 
    //     this->imag = value; 
    // }
    void printRecord( void )
    {
        cout<<"Real : "<<real<<endl; 
        cout<<"Imag : "<<imag<<endl; 
    }
}; 
//Fundamental into user-defined types 
int main()
{
    int number = 10; 
    Complex c1; 
    c1 = number; 
    //Complex(number)
    c1.printRecord( ); 
    return 0;
}
