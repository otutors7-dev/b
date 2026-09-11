#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
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
    //other = c2 
    // this = &c1
    Complex sum(Complex other)
    {
        Complex temp; 
        temp.real = this->real + other.real; 
        temp.imag = this->imag + other.imag; 
        return temp; 
    }
}; 
int main()
{
    Complex c1 , c2;  
    c1.acceptRecord( ); // 10 20
    c2.acceptRecord( ); // 30 40 
    Complex c3; 
    c3 = c1.sum(c2); 
    c3.printRecord( ); 
    return 0;
}
