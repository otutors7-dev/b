#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag; 
    public: 
    //this = &c1 
    void initComplex(int real , int imag)
    {
        cout<<this<<endl;  
        this->real = real; 
        this->imag = imag; 
    }   
    void printRecord( void )
    {
        cout<<this<<endl;  
        cout<<"Real : "<<this->real<<endl;
        cout<<"Imag : "<<this->imag<<endl; 
    } 
}; 
int main( void )
{
    Complex c1; 
    c1.initComplex(10,20); // c1.initComplex(&c1, 10,20); 
    c1.printRecord( ); // c1.printRecord(&c1); 
    return 0;
}
