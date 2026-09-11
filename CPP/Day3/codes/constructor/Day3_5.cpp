#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    void initComplex(void)
    {
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
    c1.initComplex( ); // 0 0 
    c1.acceptRecord( ); //10 20 
    c1.printRecord( ); //10 20 
    c1.initComplex( ); // 0 0 
    c1.printRecord( ); // 0 0 
    return 0;
}
