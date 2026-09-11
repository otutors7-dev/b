#include<iostream> 
using namespace std; 
//constructor cannot be declared static , const , volatile , virtual 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    Complex(void)
    {
        cout<<"Complex(void)"<<endl; 
        this->real = 0; 
        this->imag = 0; 
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
    Complex c2; 
    Complex c3; 
    return 0;
}

int main3()
{
    Complex c1; 
    Complex &c2 = c1; 
    return 0;
}

int main2()
{
    Complex *ptr; 
    return 0;
}

int main1()
{
    Complex c1;
    c1.printRecord( );  
    return 0;
}
