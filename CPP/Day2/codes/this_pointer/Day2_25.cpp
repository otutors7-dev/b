#include<iostream> 
using namespace std; 
class Complex 
{
    private: 
    int real; 
    int imag;
    public: 
    //ClassName * const this; 
    //this = &c1 
    void acceptRecord(  )
    {
        cout<<"Real : "; 
        cin>>this->real;
        cout<<"Imag : "; 
        cin>>this->imag;      
    } 
    void printRecord( void )
    {
        cout<<"Real : "<<this->real<<endl;
        cout<<"Imag : "<<this->imag<<endl; 
    }
}; 
int main()
{
    Complex c1; 
    c1.acceptRecord( ); //c1.acceptRecord(&c1); 
    c1.printRecord( ); //c1.printRecord(&c1);
    return 0;
}
