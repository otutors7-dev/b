#include<iostream>
using namespace std;

struct Date
{
    private:
    int day;
    int month;
    int year;
    int choice;

    public:
    void initDate()
    {
        day=01;
        month=01;
        year=2000;
        cout<<"\nInitial Date Is :"<<day<<"-"<<month<<"-"<<year<<"\n";
    }

    void acceptDay()
    {
        cout<<"Enter Day : \n";
        cin>>day;

    }

    void acceptMonth()
    {
        cout<<"Enter Month : \n";
        cin>>month;

    }

    void acceptYear()
    {
        cout<<"Enter Year : \n";
        cin>>year;

    }

    int menu()
    {
        cout<<"\n0 : Exit\n";
        cout<<"1 : Edit Day\n";
        cout<<"2 : Edit Month\n";
        cout<<"3 : Edit Year\n";
        cout<<"Enter choice : \n";
        cin>>choice;
        return choice;
    }
    
    void printDate()
    {
        cout<<day<<"-"<<month<<"-"<<year<<"\n";

    }

    void isLeapYear()
    {
        if(year%4==0 && year%100!=0 || year%400==0)
        {
            cout<<"Leap Year\n";
        }
        else{
            cout<<"NOt a Leap Year\n";
        }
    }
};

    int main()
    {
        Date d1;
        
        d1.initDate();
        int c=d1.menu();

        while(c!=0)
        {
         switch(c)
         {
            case 1:
              d1.acceptDay();
              d1.printDate();
              d1.menu();
            break;
            case 2:
              d1.acceptMonth();
              d1.printDate();
              d1.menu();
            break;
            case 3:
              d1.acceptYear();
              d1.printDate();
              d1.menu();
              break;

              case 4:  
              d1.printDate();
              d1.isLeapYear();
              d1.menu();
              break;

            default:
            cout<<"Invali Input";
            d1.menu();
         }
        }    
    };