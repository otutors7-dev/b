#include <iostream>
using namespace std;
class InvalidTimeException
{
private:
    string invalidField;
    int invalidValue;

public:
    InvalidTimeException(string invalidField, int invalidValue)
    {
        this->invalidField = invalidField;
        this->invalidValue = invalidValue;
    }
    string getInvalidField(void)
    {
        return this->invalidField;
    }
    int getInvalidValue(void)
    {
        return this->invalidValue;
    }
};
class Time
{
private:
    int hrs;
    int mins;
    int secs;

public:
    void setHrs(int hrs)
    {
        if (hrs < 0 || hrs > 24)
            throw InvalidTimeException("hrs", hrs);
        this->hrs = hrs;
    }
    void setMins(int mins)
    {
        if (mins < 0 || mins > 60)
            throw InvalidTimeException("mins", mins);
        this->mins = mins;
    }
    void setSecs(int secs)
    {
        if (secs < 0 || secs > 60)
            throw InvalidTimeException("secs", secs);
        this->secs = secs;
    }
    int getHrs(void)
    {
        return this->hrs;
    }
    int getMins(void)
    {
        return this->mins;
    }
    int getSecs(void)
    {
        return this->secs;
    }
    void print(void)
    {
        cout << hrs << ":" << mins << ":" << secs << endl;
    }
};
int main()
{
    try
    {
        Time t1;
        t1.setHrs(-1);
        t1.setMins(10);
        t1.setSecs(10);

        t1.print();
    }
    catch (InvalidTimeException ex)
    {
        cout<<"Field : "<<ex.getInvalidField()<<endl; 
        cout<<"Value : "<<ex.getInvalidValue( )<<endl; 
    }

    return 0;
}
