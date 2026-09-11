#include<iostream> 
using namespace std; 
class Time 
{
    private: 
    int hrs; 
    int mins; 
    int secs; 
    public: 
    void accept( void )
    {
        cout<<"Enter hrs , mins , secs :"; 
        cin>>hrs>>mins>>secs; 
    }
    void display( void )
    {
        cout<<hrs<<":"<<mins<<":"<<secs<<endl; 
    }
    void setHrs(int hrs)
    {
        this->hrs = hrs; 
    }
    void setMins(int mins)
    {
        this->mins = mins; 
    }
    void setSecs(int secs)
    {
        this->secs = secs; 
    }
    int getHrs( void ) const 
    {
        return this->hrs; 
    }
    int getMins( void ) const 
    {
        return this->mins; 
    }
    int getSecs( void ) const 
    {
        return this->secs; 
    }
    void incSecs( void )
    {
        this->secs++; 
        if(this->secs == 60)
        {
            this->secs = 0; 
            this->mins++; 
            if(this->mins == 60)
            {
                this->mins = 0; 
                this->hrs++; 
                if(this->hrs == 24)
                {
                    this->hrs = 0; 
                }
            }
        }
    }
}; 
int main(int argc, char const *argv[])
{
    Time t1; 
    t1.setHrs(22); 
    t1.setMins(59); 
    t1.setSecs(59); 
    t1.incSecs( ); 
    cout<<"hrs : "<<t1.getHrs( )<<endl;
    cout<<"mins : "<<t1.getMins( )<<endl;
    cout<<"secs : "<<t1.getSecs( )<<endl; 
    return 0;
}

int main2()
{
    Time t1; 
    //t1.hrs = 100; 
    t1.setHrs(10); // OK 
    t1.setMins(10); 
    t1.setSecs(10); 
    t1.display( ); 
    return 0;
}

int main1()
{
    Time t1; 
    t1.accept( ); 
    t1.display( ); 
    return 0;
}
