#include<iostream> 
using namespace std; 
void acceptRecord(string msg , int &number)
{
    cout<<msg; 
    cin>>number; 
}
int main()
{
    cout<<"Open the connection : "<<endl; 
    int num1; 
    ::acceptRecord("num1 : ",num1); 

    int num2; 
    ::acceptRecord("num2 : ",num2);  
    
    int res =  num1 / num2; 
    cout<<"res : "<<res<<endl; 

    cout<<"Close the connection : "<<endl;
    return 0;
}
