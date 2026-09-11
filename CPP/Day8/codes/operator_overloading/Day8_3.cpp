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
    //this = &c1 
    //other = c2
    Complex operator+(Complex other)
    {
        Complex temp; 
        temp.real = this->real + other.real; 
        temp.imag = this->imag + other.imag; 
        return temp; 
    }
    Complex operator-(Complex other)
    {
        Complex temp; 
        temp.real = this->real - other.real; 
        temp.imag = this->imag - other.imag; 
        return temp; 
    }
    Complex operator*(Complex other)
    {
        Complex temp; 
        temp.real = this->real * other.real; 
        temp.imag = this->imag * other.imag; 
        return temp; 
    }
    Complex operator+(int value)
    {
        Complex temp; 
        temp.real = this->real + value;
        temp.imag = this->imag + value; 
        return temp;  
    }
    //this = &c1 
    Complex operator+=(Complex other)
    {
        this->real+=other.real; 
        this->imag+=other.imag;
        return *this;  
    }
    //this = &c2 
    //other = c1 
    bool operator==(Complex other)
    {
        return this->real == other.real && this->imag == other.imag; 
    }
    //this = &c2 
    //other = c1 
    bool operator!=(Complex other)
    {
        return this->real != other.real || this->imag != other.imag; 
    }
    //preincrement 
    //this = &c1 
    Complex operator++( )
    {
        Complex temp ; 
        temp.real = ++this->real; 
        temp.imag = ++this->imag; 
        return temp;
    }
    //Post-increment 
    Complex operator++(int value)
    {
        Complex temp ; 
        temp.real = this->real   ++; 
        temp.imag = this->imag  ++; 
        return temp;
    }
};
int main()
{
    Complex c1(10,20); 
    Complex c2 = c1++; //c2 = c1.operator++(0); 
    c1.printRecord( );  // 11 21 
    c2.printRecord( );  // 10 20  

    return 0;
}
int main8()
{
    Complex c1(10,20); 
    Complex c2 = ++c1; //c2 = c1.operator++( ); 
    c1.printRecord( );  // 11 21 
    c2.printRecord( );  // 11 21  

    return 0;
}
int main7()
{
    Complex c1(10,20); 
    Complex c2(30,20); 
    bool res = c2 != c1; //c2.operator!=(c1);  
    if(res == true)
     cout<<"not same"; 
    else 
     cout<<"Same"; 
    return 0;
}

int main6()
{
    Complex c1(10,20); 
    Complex c2(10,20); 
    bool res = c2 == c1; //c2.operator==(c1);  
    if(res)
     cout<<"Same"; 
    else 
     cout<<"not same"; 
    return 0;
}


int main5()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1+=c2; //c1.operator+=(c2);
    c1.printRecord( ); // 40 60 
    c3.printRecord( ); // 40 60  
    return 0;
}

int main4()
{
    Complex c1(10,20); 
    Complex c2 = c1 + 4;//c2 = c1.operator+(4) 
    c2.printRecord( ); // 14 24  
    return 0;
}

int main3()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1 * c2; //c3 = c1.operator*(c2); 
    c3.printRecord( ); 
    return 0;
}
int main2()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1 - c2; //c3 = c1.operator-(c2); 
    c3.printRecord( ); 
    return 0;
}

int main1()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1 + c2; //c3 = c1.operator+(c2) 
    c3.printRecord( ); 
    return 0;
}
