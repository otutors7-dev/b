#include<iostream> 
class InstanceCounter 
{
    private: 
    static int count;
    public: 
    InstanceCounter( void )
    {
        InstanceCounter::count++; 
    } 
    static int getCount( void )
    {
        return InstanceCounter::count; 
    }
}; 
int InstanceCounter :: count = 0; //Global Defination 
int main()
{
    InstanceCounter i1 , i2 , i3; 
    //std::cout<<i1.getCount();
    std::cout<<InstanceCounter::getCount();
    return 0;
}
