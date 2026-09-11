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
    Complex( int real , int imag ) : real(real) , imag(imag) 
    {   }
    //this = &c2 
    //other = c1 
    Complex(const Complex &other)
    {
        //shallow copy 
        cout<<"Complex(const Complex &other)"<<endl; 
        this->real = other.real; 
        this->imag = other.imag; 
    }
    void printRecord( void)
    {
        cout<<"Real : "<<real<<endl; 
        cout<<"Imag : "<<imag<<endl; 
    }
    //If we pass object as a argument to the function by value then its 
    //copy gets created in function parameter. On function parameter 
    //copy constructor gets called.
    Complex sum(Complex other)
    {
        Complex temp; 
        temp.real = this->real + other.real; 
        temp.imag = this->imag + other.imag; 
        return temp; 
        //If we return object from function by value then its copy 
        //gets created inside in memory(anonymousobject). On
        //anonymousobject, copy constructor gets called
    }
}; 
int main()
{
    try
    {
         //If we throw object then its copy gets created 
         //on environmental stack.
         //Compiler invoke copy constructor on object created on stack
        Complex c1; 
        throw c1; 
    }
    //If we catch object by value then on catching 
    //object copy constructor getscalled.
    catch(Complex ex)
    {
        
    }
    
    return 0;
}

int main3()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1.sum(c2); 
    c3.printRecord( ); 
    return 0;
}

int main2()
{
    Complex c1(10,20); 
    Complex c2(c1); //on c2 object copy ctor will get called 
    c2.printRecord( ); 
    return 0;
}

int main1()
{
    Complex c1(10,20); 
    //If we initialize object from another object of same class 
    //then on newly created object copy constructor gets 
    //called.
    Complex c2 = c1; //copy ctor will get called on c2 object 
    c2.printRecord( ); 
    return 0;
}
