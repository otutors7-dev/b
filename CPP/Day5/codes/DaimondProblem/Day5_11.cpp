#include<iostream> 
using namespace std; 
//During diamond inheritance, 
//data members of indirect base class 
//inherit into indirect derived class 
//multiple times. 
//Hence it affects on size of object 
//of indirect derived class.
class A 
{
    private: 
    int num1; 
    public: 
    A( void )
    {
        this->num1 = 10; 
    }
    A(int num1)
    {
        this->num1 = num1; 
    }
    void printRecord( void)
    {
        cout<<"num1 : "<<num1<<endl; 
    }
}; 
class B : public A 
{
    private: 
    int num2;
    public: 
    B( void )
    {
        this->num2 = 20; 
    } 
    B(int num1 , int num2) : A ( num1 )
    {
        this->num2 = num2; 
    }
    void printRecord( void )
    {
        A::printRecord( ); 
        cout<<"num2 : "<<num2<<endl; 
    }
}; 
class C : public A 
{
    private: 
    int num3; 
    public: 
    C( void )
    {
        this->num3 = 30; 
    } 
    C(int num1 , int num3) : A ( num1 )
    {
        this->num3 = num3; 
    }
    void printRecord( void )
    {
        A::printRecord( ); 
        cout<<"num3 : "<<num3<<endl; 
    }
};
class D : public B , public C 
{
    private: 
    int num4; 
    public: 
    D( void )
    {
        this->num4 = 40; 
    }
    D(int num1 , int num2 , int num3 , int num4) : B(num1,num2) , C(num1,num3)
    {
        this->num4 = num4; 
    }
    void printRecord(  void )
    {
        B::printRecord( ); 
        C::printRecord( ); 
        cout<<"num4 : "<<num4<<endl; 
    }

};  
int main()
{
    //D d; 
    //d.printRecord( ); 
    D d1(10,20,30,40); 
    //d1.printRecord( ); 
    cout<<sizeof(d1); // 
    return 0;
}

int main3()
{
    //C c; 
    //c.printRecord( ); 
    C c(10,30); 
    c.printRecord( ); 
    return 0;
}

int main2()
{
    //B b; 
    //b.printRecord( ); 
    B b2(10,20); 
    b2.printRecord( ); 
    return 0;
}

int main1()
{
    //A a; 
    A a1(10); 
    //a.printRecord( ); 
    a1.printRecord( ); 
    return 0;
}
