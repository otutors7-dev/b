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
    operator int( )
    {
        return this->real; 
    }
    void printRecord( void )
    {
        cout<<"Real : "<<real<<endl; 
        cout<<"Imag : "<<imag<<endl; 
    }
}; 
//User-defined to fundamental  
int main()
{
    Complex c1(10,20); 
    int real = c1; 
    //c1.operator int( );
    cout<<"Real : "<<real<<endl;  
    return 0;
}
