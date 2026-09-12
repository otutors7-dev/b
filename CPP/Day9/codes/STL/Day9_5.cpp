#include<iostream> 
#include<map>
using namespace std; 
int main()
{
    map<string,string> contacts; 
    contacts["Ketan"] = "8805822402";
    contacts["Rahul"] = "8805822403"; 
    contacts["Amit"] = "8805822403";
    contacts["Akshay"] = "8805822403";

    string name , contact; 
    cout<<"Enter the name : "; 
    cin>>name; 
    contact = contacts[name]; 
    cout<<contact<<endl; 
    return 0;
}
