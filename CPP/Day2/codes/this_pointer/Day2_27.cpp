#include<iostream> 
using namespace std;
//Step1: Understand requirement and Declare the class 
class Date 
{
    //Step2: Declare the data-members 
    //Step4: access specfier
    private:  
    int day; 
    int month; 
    int year;
    public:
    //this = &dt1  
    void acceptDate( void )
    {
        cout<<"Day : "; 
        cin>>this->day; 
        cout<<"Month : "; 
        cin>>this->month; 
        cout<<"Year : "; 
        cin>>this->year; 
    } 
    void printDate( void )
    {
        cout<<this->day<<"/"<<this->month<<"/"<<this->year<<endl; 
    }
}; 

int main()
{
    //Step3: Creating the Object
    Date dt1;
    //Step5: calling methods
    dt1.acceptDate( ); // d1.acceptDate(&dt1); 
    dt1.printDate( ); // dt1.printDate(&dt1); 
    return 0;
}
