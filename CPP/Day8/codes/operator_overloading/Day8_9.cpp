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
    friend ostream& operator<<(ostream &out , Complex &c1); 
    friend istream& operator>>(istream &in , Complex &c1);  
};
ostream& operator<<(ostream &out , Complex &c1)
{
    out<<c1.real<<endl; 
    out<<c1.imag<<endl; 
    return out; 
}
istream& operator>>(istream &in , Complex &c1)
{
    cout<<"Real : "; 
    in>>c1.real; 
    cout<<"Imag : "; 
    in>>c1.imag; 
    return in; 
}
int main()
{
    Complex c1,c2; 
    cin>>c1>>c2; //operator>>(operator>>(cin,c1) , c2); 
    cout<<c1<<c2; //operator<<(operator<<(cout , c1) , c2); 
    return 0;
}

