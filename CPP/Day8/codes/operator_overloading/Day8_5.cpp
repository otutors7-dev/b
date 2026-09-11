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
    Complex(int real , int imag) : real(real) , imag(imag)
    {   }
    void printRecord( void )
    {
        cout<<"Real : "<<real<<endl;
        cout<<"Imag : "<<imag<<endl; 
    }
    void operator()(int real, int imag)
    {
        this->real = real; 
        this->imag = imag; 
    }
};
int main()
{
    Complex c1; 
    c1(10,20); // c1.operator()(10,20)
    c1.printRecord( ); //10 20 
    return 0;
}
