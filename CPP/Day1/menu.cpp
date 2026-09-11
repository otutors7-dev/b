#include<iostream>
using namespace std;
class operations
{
    int a;
    int b;
     int c;
    public:
     int menu()
    {
       
        cout<<"0 : Addition\n";
        cout<<"1 : Substraction\n";
        cout<<"2 : Division\n";
        cout<<"3 : Multiplication\n";
        cout<<"4 : Exit\n";
        cin>>c;
        
        return c;

    }
    void addData()
    {
        cout<<"Enter first Number :\n ";
        cin>>a;
        cout<<"Enter Second number\n";
        cin>>b;
        int add=a+b;
        cout<<"Addition :\n "<<add;
    }
    void subData()
    {
        cout<<"Enter first number\n";
        cin>>a;
        cout<<"Enter second number\n";
        cin>>b;
        int sub=a-b;
        cout<<"Substraction :\n "<<sub;
    }
    void divisionData()
    {
        cout<<"Enter first NUmber\n";
        cin>>a;
        cout<<"Enter second number\n";
        cin>>b;
        int div = a/b;
        cout<<"Division :\n "<<div;
    }
    void mulData()
    {
        cout<<"Enter first number :\n ";
        cin>>a;
        cout<<"Enter second number :\n ";
        cin>>b;
        int mul=a*b;
        cout<<"Multiplicatiion :\n "<<mul;
    }
    
};
int main()
    {
        class operations op1;
       int c=op1.menu();
       switch (c)
       {
       case 0:
        op1.addData();
        break;

        case 1:
        op1.subData();
        break;

        case 3:
        op1.divisionData();
        break;

        case 4:
        op1.mulData();
        break;

       
       default:
       cout<<"invalid data";
        break;
       }

    };