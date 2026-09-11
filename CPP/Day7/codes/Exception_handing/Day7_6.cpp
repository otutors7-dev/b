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
    
     try
     {
         if(num2 == 0)
         {
            throw 10; 
         }
         else 
         {
            int res = num1 / num2; 
            cout<<"Res : "<<res<<endl; 
         }
     }
     catch(int x)
     {
        cout<<"int : Exception caught"<<endl; 
     }
     cout<<"Close the connection : "<<endl;

 
    return 0;
}
