#include<iostream> 
#include<typeinfo>
void printNumber(const int *p); 
class Product; 
void printProduct(Product *p);
void printBook(Product *p);  
using namespace std; 
class Product
{
    private: 
    string name; 
    double price; 
    public: 
    Product( void ) : name("") , price(0.0)
    {   }
    Product(string name , double price)  : name(name) , price(price)
    {   }
    void setName(string name)
    {
        this->name = name; 
    }
    void setPrice(double price)
    {
        this->price = price; 
    }
    string getName( void )
    {
        return this->name; 
    }
    double getPrice( void )
    {
        return this->price; 
    }
    virtual void accept( void )
    {
        cout<<"Name : "; 
        cin>>name; 
        cout<<"Price : "; 
        cin>>price; 
    }
    void display( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Price : "<<price<<endl; 
    }
};
class Book : public Product
{
    private: 
    int pageCount; 
    public: 
    Book( void ) : pageCount(0)
    {   }
    Book(string name , double price , int pageCount) : Product(name,price)
    {
        this->pageCount = pageCount; 
    }
    void setPageCount(int pageCount)
    {
        this->pageCount = pageCount; 
    }
    int getPageCount( void )
    {
        return this->pageCount; 
    }
    void accept( void )
    {
        Product::accept( ); 
        cout<<"PageCount : "; 
        cin>>pageCount; 
    }
    void display( void )
    {
        Product::display( ); 
        cout<<"PageCount : "<<pageCount<<endl; 
    }
}; 
class Tape : public Product
{
    private: 
    int duration; 
    public: 
    Tape( void ) : duration( 0 ) 
    {   }
    Tape(string name , double price , int duration) : Product(name , price)
    {
        this->duration = duration; 
    }
    void setDuration( int duration )
    {
        this->duration = duration; 
    }
    int getDuration( void )
    {
        return this->duration; 
    }
    void accept( void )
    {
        Product::accept( ); 
        cout<<"Duration : "; 
        cin>>duration; 
    }
    void display( void )
    {
        Product::display( ); 
        cout<<"Duration : "<<duration<<endl; 
    }
}; 
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
}; 
int main()
{
    Book bk1; 
    const type_info& tiB1 = typeid(bk1); 
    //cout<<"Type : "<<tiB1.name( )<<endl; 
    Tape tp1; 
    Product *p = &tp1; 
    const type_info& tiP1 = typeid(*p); 
    // if(tiP1 == typeid(Tape))
    //   cout<<"Product is a tape"<<endl;
    // else if(tiP1 == typeid(Book))
    //   cout<<"Product is a Book"<<endl;
    // else 
    //   cout<<"Product is a Product"<<endl; 

    Book bk2("Cprogramming",200,100); 
    //printProduct(&bk2); 
    Tape tp2("ABC",100,300); 
    //printProduct(&tp2); 
    Book bk3("LetUsC",100,300); 
    //printBook(&bk3); 

    int number = 10; 
    cout<<"Inside main before function call"<<number<<endl; //10 
    //printNumber(&number); 
    cout<<"Inside main after function call"<<number<<endl; // 500  
    
    Complex c1(10,20); 
    //Complex *ptrComplex = &c1; 
    int *itrComplex = reinterpret_cast<int*>(&c1);
    *itrComplex = 500; 
    itrComplex++;  
    *itrComplex = 1000;
    c1.printRecord( ); // 500 1000 
    return 0;
}
void printNumber(const int *p)
{
    //*p = 500; // NOT OK (p is declared as cont )
    //const int *q = p; 
  //If we want convert pointer to constant object into pointer to non constant object
  //or reference to constant object into reference to non constant object 
  //then we should use const_cast operator.

    int *q = const_cast<int*>(p); 
    *q = 500; 
}
void printProduct(Product *p)
{
    cout<<"Product Information : Title , Price "<<endl;
    cout<<"Name : "<<p->getName( )<<endl;
    cout<<"Price : "<<p->getPrice( )<<endl; 
    Tape *t = dynamic_cast<Tape*>(p); 
    if(t!=NULL)
    {
        cout<<"Duration : "<<t->getDuration( )<<endl; 
    }  
    Book *b = dynamic_cast<Book*>(p); 
    if(b!=NULL)
    {
        cout<<"PageCount : "<<b->getPageCount( )<<endl; 
    }
}
void printBook(Product *p)
{
    cout<<"Product Information : Title , Price "<<endl;
    cout<<"Name : "<<p->getName( )<<endl;
    cout<<"Price : "<<p->getPrice( )<<endl; 
    Book *b = static_cast<Book*>(p); 
    cout<<"PageCount : "<<b->getPageCount( )<<endl; 
}
