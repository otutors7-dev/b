#include<iostream> 
using namespace std; 
class Base
{
    private: 
    int num1; 
    int num2; 
    public: 
    Base( void ) : num1(0) , num2(0)
    {   }
    void setNum1(int num1)
    {
        this->num1 = num1; 
    }
    void setNum2(int num2)
    {
        this->num2 = num2; 
    }
    void printRecord( void )
    {
        cout<<"num1 : "<<num1<<endl;
        cout<<"num2 : "<<num2<<endl;
    }
    virtual ~Base( )
    {   }
}; 
class Derived : public Base
{
    private: 
    int num3; 
    public: 
    Derived( void ) : num3(0)
    {   }
    void setNum3(int num3)
    {
        this->num3 = num3; 
    }
    void printRecord( void )
    {
        Base::printRecord( ); 
        cout<<"num3 : "<<num3<<endl;  
    }
}; 
int main()
{
    Base *ptrBase = new Base( );
    ptrBase->setNum1(10);
    ptrBase->setNum1(20);  
    //Derived *ptrDerived = (Derived*)ptrBase; // NOT OK   
    Derived *ptrDerived = dynamic_cast<Derived*>(ptrBase); // NOT OK   
    if(ptrDerived!=NULL)
    {
        ptrDerived->setNum3(30); 
    }
    else 
      cout<<"Invalid Conversion"<<endl; 
    return 0;
}

int main7()
{
    Base *ptrBase = new Derived( ); 
    ptrBase->setNum1(10);
    ptrBase->setNum2(20);
    //Derived *ptrDerived = (Derived*)ptrBase;  
    Derived *ptrDerived = dynamic_cast<Derived*>(ptrBase);
    ptrDerived->setNum3(30); 
    ptrDerived->printRecord( );   
    return 0;
}

int main6()
{
    Base *ptrBase = new Base( ); 
    ptrBase->setNum1(10); 
    ptrBase->setNum2(20); 
    //static_cast operator do not check whether type conversion is valid or invalid. It only checks inheritance 
    //between type of source and destination at compile time.
    Derived *ptrDerived = static_cast<Derived*>(ptrBase); // NOT OK
    delete ptrBase; 
    ptrBase = NULL; 
    delete ptrDerived; 
    ptrDerived = NULL;  
    return 0;
}

int main5()
{
    Base *ptrBase = new Derived( );
    ptrBase->setNum1(10);
    ptrBase->setNum2(20);  
    //Derived *ptrDerived = (Derived*)ptrBase; 
    Derived *ptrDerived = static_cast<Derived*>(ptrBase); 
    ptrDerived->setNum3(30);
    ptrDerived->printRecord( );  
    return 0;
}

int main4()
{
    Base *ptrBase = new Derived( ); 
    ptrBase->setNum1(10); 
    ptrBase->setNum2(20); 
    Derived *ptrDerived = (Derived*)ptrBase;
    ptrDerived->setNum3(30); 
    ptrDerived->printRecord( );  
    return 0;
}

int main3()
{
    Derived *ptrDerived = new Derived(); 
    ptrDerived->setNum1(10); // 10 
    ptrDerived->setNum2(20); // 20 
    Base *ptrBase = ptrDerived;  // upcasting 
    ptrDerived = (Derived*)ptrBase; //downcasting 
    ptrDerived->setNum3(30); 
    ptrDerived->printRecord( ); 
    delete ptrDerived;
    ptrDerived = NULL;  
    delete ptrBase; 
    ptrBase = NULL; 
    return 0;
}

int main2()
{
    Derived *ptrDerived = new Derived();
    ptrDerived->setNum1(10); 
    ptrDerived->setNum2(20); 
    ptrDerived->setNum3(30); 
    ptrDerived->printRecord( ); //10 20 30  
    return 0;
}

int main1()
{
    Base *ptrBase = new Base( ); 
    ptrBase->setNum1(10);
    ptrBase->setNum2(20);
    ptrBase->printRecord( ); 
    delete ptrBase; 
    ptrBase = NULL;  
    return 0;
}
