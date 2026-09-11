#include <iostream>
using namespace std;
class Base
{
private:
    int num1;
    int num2;

public:
    Base(void) : num1(0), num2(0)
    {
    }
    Base(int num1, int num2) : num1(num1), num2(num2)
    {
    }
    void showRecord(void)
    {
        cout << "num1 : " << num1 << endl;
        cout << "num2 : " << num2 << endl;
    }
};
class Derived : public Base
{
private:
    int num3;

public:
    Derived(void) : num3(0)
    {
    }
    Derived(int num1, int num2, int num3) : Base(num1, num2)
    {
        this->num3 = num3;
    }
    void displayRecord(void)
    {
        Base::showRecord();
        cout << "num3 : " << num3 << endl;
    }
};
int main()
{
    Derived d1;
    Base *ptrBase = &d1; // upcasting
    // ptrBase->showRecord( );
    Derived *ptrDerived = (Derived *)ptrBase; // downcasting
    ptrDerived->displayRecord();
    return 0;
}

int main14()
{
    Base *ptrBase = new Base(10, 20);         // NOT OK
    Derived *ptrDerived = (Derived *)ptrBase; // downcasting
    ptrDerived->displayRecord();
    return 0;
}

int main13()
{
    Base *ptrBase = new Derived(10, 20, 30); // upcasting
    // ptrBase->showRecord( ); //10 20
    Derived *ptrDerived = (Derived *)ptrBase; // downcasting
    ptrDerived->displayRecord();              // 10 20 30
    return 0;
}

int main12()
{
    Derived *ptrDerived = new Derived(10, 20, 30);
    Base *ptrBase = ptrDerived; // upcasting
    // ptrBase->showRecord( ); //10 20
    ptrDerived = (Derived *)ptrBase; // downcasting
    ptrDerived->displayRecord();     // 10 20 30
    return 0;
}

int main11()
{
    Derived *ptrDerived = new Derived(10, 20, 30);
    // Base *ptrBase = (Base*)ptrDerived; //upcasting
    Base *ptrBase = ptrDerived; // upcasting
    // converting pointer of derived class into pointer of base class
    ptrBase->showRecord(); // 10 20
    return 0;
}

int main10()
{
    Derived d1(10, 20, 30);
    Base b1;
    b1 = d1;
    b1.showRecord();
    return 0;
}

int main9()
{
    Base b1(10, 20);
    Base b2;
    b2 = b1;
    b2.showRecord();
    return 0;
}

int main8()
{
    Derived d1(10, 20, 30);
    Derived d2;
    d2 = d1;
    d2.displayRecord();
    return 0;
}

int main7()
{
    Derived *ptrDerived = new Derived(10, 20, 30);
    // ptrDerived->displayRecord( ); // Derived::displayRecord( );
    // ptrDerived->showRecord( ); // Base::showRecord( );
    ptrDerived->Base::showRecord(); // Base::showRecord( );
    return 0;
}

int main6()
{
    Base *ptrBase = new Base(10, 20);
    // ptrBase->showRecord( ); //Base::showRecord();
    // ptrBase->Derived::displayRecord( ); // NOT OK
    delete ptrBase;
    ptrBase = NULL;
    return 0;
}

int main5()
{
    Base *ptrBase = new Base();
    // ptrBase->showRecord( ); // Base::showRecord( );
    // ptrBase->Derived::displayRecord( );
    delete ptrBase;
    ptrBase = NULL;
    return 0;
}

int main4()
{
    Derived derived(10, 20, 30);
    // derived.displayRecord( ); // Derived::displayRecord( );
    derived.Base::showRecord();
    return 0;
}

int main3()
{
    Derived derived;
    // derived.displayRecord( ); //Derived::displayRecord( );
    derived.Base::showRecord();
    return 0;
}

int main2()
{
    Base base(10, 20);
    // base.showRecord( );
    // base.Derived::displayRecord( ); // NOT OK
    return 0;
}

int main1()
{
    Base base;
    // base.showRecord( ); // Base::showRecord( );
    // base.Derived::displayRecord( );
    return 0;
}
