#include <iostream>

using namespace std;

class Base
{
private:
    int num1;
    int num2;

public:
    Base(void) : num1(10), num2(20)
    {
    }
    virtual void f1(void)
    {
        cout << "Base::f1" << endl;
    }
    virtual void f2(void)
    {
        cout << "Base::f2" << endl;
    }
    virtual void f3(void)
    {
        cout << "Base::f3" << endl;
    }
    void f4(void)
    {
        cout << "Base::f4" << endl;
    }
    void f5(void)
    {
        cout << "Base::f5" << endl;
    }
};
class Derived : public Base
{
private:
    int num3;

public:
    Derived(void) : num3(30)
    {
    }
    virtual void f1(void)
    {
        cout << "Derived::f1" << endl;
    }
    void f2(void)
    {
        cout << "Derived::f2" << endl;
    }
    /*
    Inherited from Base class
    virtual void f3(void)
    {
        cout<<"Base::f3"<<endl;
    }
    */
    void f4(void)
    {
        cout << "Derived::f4" << endl;
    }
    virtual void f5(void)
    {
        cout << "Derived::f5" << endl;
    }
    virtual void f6(void)
    {
        cout << "Derived::f6" << endl;
    }
};
int main4()
{
    Base *ptr = new Derived(); // upcasting
    // ptr->f1( ); // Derived :: f1 ==> Late binding
    // ptr->f2( ); // Derived :: f2 ==> Late binding
    // ptr->f3( ); //Base::f3=> late Binding ( f3 doesn't exist in derived class but it gets inherited)
    // ptr->f4( ); //Base::f4 => early binding
    // ptr->f5( );//Base::f5 => early binding
    // ptr->f6( ); //ERROR ( f6 is not in Base class)
    delete ptr;
    return 0;
}


int main3()
{
    Derived *ptr = new Derived();
    // ptr->f1( ); //Derived :: f1 => Late Binding
    // ptr->f2( ); //Derived :: f2=>Late Binding  (base class f2 is virtual so derived f2 is virtual now)
    // ptr->f3( ); //Base :: f3 => Late Binding (Inherited Function is called)
    // ptr->f4( ); //Derived :: f4 => Early Binding ( f4 is not virtual in Base class as well as derived class)
    // ptr->f5( ); //Derived :: f5 => late Binding
    // ptr->f6( ); // Derived :: f6 => late Binding
    delete ptr;
    return 0;
}
int main2()
{
    // virtual function call with pointer => late binding
    Base *ptr = new Base();
    //ptr->f1( ); //Base::f1 => late binding
    // ptr->f2( ); //Base::f2 => late binding
    // ptr->f3( ); //Base::f3 => late binding
    // ptr->f4( ); //Base::f4 => Early Binding ( not a virtual so early binding )
    // ptr->f5( );//Base::f5 => Early Binding ( not a virtual so early binding )
    // ptr->f6( ); //ERROR ( not exist )
    delete ptr;
    return 0;
}

int main1()
{
    // calling any virtual or non-virtual on object is early binding
    Base base;
    // base.f1( ); //Base :: f1 ==> Early Binding
    // base.f2( ); //Base :: f2 ==> Early Binding
    // base.f3( ); //Base :: f3 ==> Early Binding
    // base.f4( );//Base :: f4 ==> Early Binding
    // base.f5( );//Base :: f5 ==> Early Binding
    // base.f6( ); // ERROR (function not exist)
    return 0;
}
