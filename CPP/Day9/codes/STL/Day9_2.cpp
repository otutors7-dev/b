#include<iostream> 
#include<list> 
using namespace std;
/*
     //list -> doubly linked list 
     //-push_back() -- add ele at the end 
     //-push_front() -- add ele at the start 
*/ 
int main()
{
    list<int> l; 
    l.push_back(10);
    l.push_back(20);
    l.push_back(30);
    l.push_back(40); 
    cout<<"size : "<<l.size( )<<endl; 
    cout<<"FWD"<<endl; 

    list<int> :: iterator itr = l.begin( ); 
    while(itr!=l.end( ))
    {
        cout<<*itr<<endl; 
        itr++; 
    }
    //pop_front , pop_back(removing first and last element) 
    l.pop_front( ); 
    l.pop_back( );  
    itr = l.begin( ); 
    cout<<endl; 
    while(itr!=l.end( ))
    {
        cout<<*itr<<endl; 
        itr++; 
    }
    l.remove(30); 
    cout<<endl; 
    itr = l.begin( ); 
    cout<<endl; 
    while(itr!=l.end( ))
    {
        cout<<*itr<<endl; 
        itr++; 
    }
    return 0;
}
