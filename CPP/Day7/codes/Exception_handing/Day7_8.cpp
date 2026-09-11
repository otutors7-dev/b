#include<iostream> 
using namespace std; 
class ArithmeticException
{
    private: 
    string message; 
    public: 
    ArithmeticException(string message)
    {
        this->message = message; 
    }
    string getMessage(void)
    {
        return this->message; 
    }
}; 
void acceptRecord(string msg , int &number)
{
    cout<<msg; 
    cin>>number; 
}
void printRecord(int res)
{
    cout<<"Res : "<<res<<endl; 
}
int divide(int num , int den) 
{
    if(den == 0)
      throw ArithmeticException("Divide by zero"); 
    int res = num / den; 
    return res; 
}
int main()
{
    cout<<"Open the connection  "<<endl; 
    int num1; 
    ::acceptRecord("num1 : ",num1); 

    int num2; 
    ::acceptRecord("num2 : ",num2);  
    try
    {
        int res = ::divide(num1,num2); 
        printRecord(res); 
    }
    catch(ArithmeticException ex)
    {
        cout<<ex.getMessage( )<<endl; 
    }
    cout<<"Close the connection  "<<endl;

 
    return 0;
}
