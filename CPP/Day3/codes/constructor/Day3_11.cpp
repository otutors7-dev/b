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
    Complex( void )
    {
        cout<<"Complex( void )"<<endl; 
        this->real = 0; 
        this->imag = 0; 
    }
    Complex(int real , int imag) //double value parameterized ctor 
    {
        cout<<"Complex(int real , int imag)"<<endl;  
        this->real = real; 
        this->imag = imag; 
    }
    Complex(int value) //single value parameterized ctor 
    {
        cout<<"Complex(int value)"<<endl;  
        this->real = value; 
        this->imag = value; 
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
    //Complex *ptr; // no ctor will get called on pointer 
    //Complex c1; 
    //Complex &c2 = c1; // no ctor will get called on reference
    //Complex c3; // parameter-less ctor will get called 
    //Complex c4(10,20); // 2 parameterized ctor will get called 
    //Complex c5 = 10; //Complex c5(10); // single value parameterized 
    //Complex c6 = 10,20; 
    //Complex c7 = (10,20); //right most value is considered 
    //c7.printRecord( );  
    //Complex c8( ); //function declaration 
    Complex (10,20);//Anonymous object  2 parameterized ctor will get called  
    //Complex c9 = {10,20}; //c++ 11 
    //c9.printRecord( ); 
    return 0;
}

