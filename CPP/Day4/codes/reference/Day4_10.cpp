#include<iostream> 
using namespace std; 
class A
{
    public: 
    int n1; 
    int n2; 
    int n3; 
}; 
void accept(A &obj1)
{
    cout<<"Enter n1 , n2 , n3"; 
    cin>>obj1.n1>>obj1.n2>>obj1.n3; 
}
void display(A &obj1)
{
    cout<<obj1.n1<<obj1.n2<<obj1.n3<<endl; 
}
class Test 
{
    private: 
    char &ref; 
    public: 
    Test(char &ch) : ref( ch )
    {   }
    void incr( )
    {
        ref++; 
    }
    void display( void)
    {
        cout<<ref<<endl; 
    }
}; 
int main()
{
    //A obj;
    //::accept(obj); 
    //::display(obj); 
    
    char ch = 'A'; 
    //cout<<sizeof(ch)<<endl; //1 byte
    //cout<<sizeof(Test)<<endl; //1 byte 
    // Test t1(ch); 
    // t1.incr( ); 
    // t1.display( ); 
    char ch1 = 'A' , ch2 = 'B' , ch3 = 'C'; 
    Test arr[3] = {ch1 , ch2 , ch3};// ctor will be called  
    //Test arr[3] = {Test(ch1) , Test(ch2) , Test(ch3)}; 
    for(int index = 0 ; index < 3 ; index++)
       arr[index].incr( ); 
    for(int index = 0 ; index < 3 ; index++)
       arr[index].display( );  
    return 0;
}
