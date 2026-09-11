#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex( void ) : real(0) , imag(0)
    {   
        cout<<"Complex( void ) "<<" "<<this<<endl; 
    }
    Complex(int real , int imag) : real(real) , imag(imag)
    {   
        cout<<"Complex(int real , int imag)"<<endl; 
    }
    void printRecord( void )
    {
        cout<<"Real : "<<this->real<<endl;
        cout<<"Imag : "<<this->imag<<endl; 
    }
    
}; 
int main()
{
    Complex *ptr = (Complex*)malloc(sizeof(Complex)); 
    free(ptr); 
    ptr = NULL; 
    return 0;
}

int main4()
{
    Complex *ptr = new Complex[2]{ Complex(10,20) , Complex(30,40) }; 
    delete[ ] ptr; 
    ptr = NULL; 
    return 0;
}

int main3()
{
    Complex *ptr = new Complex(10,20); 
    delete ptr; 
    ptr = NULL; 
    return 0;
}

int main2()
{
    Complex *ptr = new Complex( ); 
    delete ptr; 
    ptr = NULL; 
    return 0;
}

int main1()
{
    Complex c1; 
    Complex c2; 
    Complex c3;  
    return 0;
}
