#include<iostream> 
#include<vector>
using namespace std; 
int main()
{
    vector<int> v1; 
    cout<<"size : "<<v1.size( )<<endl; 
    v1.push_back(10); //Appends a copy of value to the end of the container
    v1.push_back(20);
    v1.push_back(30);
    v1.push_back(40); 
    cout<<"size : "<<v1.size( )<<endl; //4 
    cout<<endl; 
    //cout<<v1[10]<<endl; 
    //cout<<v1[0]<<endl;
    // for(int i = 0 ; i < v1.size( ) ; i++)
    //   cout<<v1[i]<<endl;  
    cout<<"FWD: "; 
    vector<int> :: iterator itr = v1.begin( ); 
    while(itr!=v1.end( ))
    {
        cout<<*itr<<endl; 
        itr++; 
    }
    return 0;
}
