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
    friend Complex operator+(Complex c1 , Complex c2); 
    friend Complex operator-(Complex c1 , Complex c2); 
    friend Complex operator*(Complex c1 , Complex c2); 
    friend Complex operator+(Complex c1 , int value);
    friend Complex operator+=(Complex &c1 , Complex &c2);  
    friend bool operator==(Complex c1 , Complex c2); 
    friend bool operator!=(Complex c1 , Complex c2);
    friend Complex operator++(Complex &c1);  
    friend Complex operator++(Complex &c1 ,int value); 
};
Complex operator+(Complex c1 , Complex c2)
{
    Complex temp; 
    temp.real = c1.real + c2.real; 
    temp.imag = c1.imag + c2.imag; 
    return temp; 
}
Complex operator-(Complex c1 , Complex c2)
{
    Complex temp; 
    temp.real = c1.real - c2.real; 
    temp.imag = c1.imag - c2.imag; 
    return temp; 
}
Complex operator*(Complex c1 , Complex c2)
{
    Complex temp; 
    temp.real = c1.real * c2.real; 
    temp.imag = c1.imag * c2.imag; 
    return temp; 
}
Complex operator+(Complex c1 , int value)
{
    Complex temp; 
    temp.real = c1.real + value; 
    temp.imag = c1.imag + value; 
    return temp; 
}
Complex operator+=(Complex &c1 , Complex &c2)
{
    c1.real+=c2.real; 
    c1.imag+=c2.imag; 
    return c1; 
}
bool operator==(Complex c1 , Complex c2)
{
     return c1.real == c2.real && c1.imag == c2.imag; 

}
bool operator!=(Complex c1 , Complex c2)
{
     return c1.real != c2.real || c1.imag != c2.imag; 

}
Complex operator++(Complex &c1)
{
    Complex temp; 
    temp.real = ++c1.real; 
    temp.imag = ++c1.imag; 
    return temp; 
}
Complex operator++(Complex &c1 ,int value)
{
    Complex temp; 
    temp.real = c1.real++; 
    temp.imag = c1.imag++; 
    return temp; 
}
int main()
{
    Complex c1(10,20); 
    Complex c2 = c1++; //c2 = operator++(c1 , 0); 
    c1.printRecord( );  //11 21 
    c2.printRecord( );  //10 20 
    return 0;
}

int main7()
{
    Complex c1(10,20); 
    Complex c2 = ++c1; //c2 = operator++(c1); 
    c1.printRecord( );  // 11 21 
    c2.printRecord( );  // 11 21  
    return 0;
}

int main6()
{
    
    Complex c1(20,30); 
    Complex c2(10,20); 
    bool res = c1 != c2; //operator!=(c1,c2); 
    if(res == true)
     cout<<"not Same"; 
    else 
     cout<<"same"; 
    return 0;
}

int main5()
{
    Complex c1(10,20); 
    Complex c2(10,20); 
    bool res = c1 == c2; //operator==(c1,c2); 
    if(res == true)
     cout<<"Same"; 
    else 
     cout<<"Not same"; 
    return 0;
}

int main4()
{
    
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1+=c2; //c3 = operator+=(c1,c2); 
    c3.printRecord( ); 
    c1.printRecord( ); 
    return 0;
}

int main3()
{
    Complex c1(10,20); 
    Complex c2 = c1 + 4; //c2 = operator+(c1,4); 
    c2.printRecord( ); //14 24 
    return 0;
}

int main2()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1 * c2; //c3 = operator*(c1,c2); 
    c3.printRecord( );     
    return 0;
}

int main1()
{
    Complex c1(10,20); 
    Complex c2(30,40); 
    Complex c3 = c1 + c2; //c3 = operator+(c1,c2);  
    c3.printRecord( );     
    return 0;
}
