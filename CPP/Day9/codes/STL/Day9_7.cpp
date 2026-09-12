#include<algorithm> 
#include<vector> 
#include<iostream> 
using namespace std; 
void display(vector<int> v)
{
    vector<int> :: iterator itr = v.begin( ); 
    while(itr!=v.end( ))
    {
        cout<<*itr<<endl; 
        itr++; 
    }
}
int main()
{
    vector<int> v1; 
    v1.push_back(30);
    v1.push_back(10); 
    v1.push_back(20);
    v1.push_back(50);
    v1.push_back(40);
    display(v1); 
    cout<<"SORTED"<<endl; 
    sort(v1.begin() , v1.end( )); //global functions 
    display(v1); 
    reverse(v1.begin( ) , v1.end( ));
    cout<<"REV ELE" <<endl;  
    display(v1);
    cout<<endl; 
    vector<int> :: iterator itr = max_element(v1.begin( ) , v1.end( )); 
    cout<<*itr<<endl; 
    v1.push_back(30); 
    v1.push_back(30); 
    int cnt = count(v1.begin( ) , v1.end( ) , 30); 
    cout<<cnt<<endl; 
    return 0;
}
