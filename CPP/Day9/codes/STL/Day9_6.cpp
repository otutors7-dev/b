#include<iostream> 
#include<vector>
using namespace std; 
int main()
{
    vector<int> v1; 
    v1.push_back(10);
    v1.push_back(20); 
    v1.push_back(30);
    v1.push_back(40);

    cout<<"FWD : "; 
    vector<int> :: iterator itr1 = v1.begin( ); 
    while(itr1!=v1.end( ))
    {
        cout<<*itr1<<endl; 
        itr1++; 
    }
    cout<<endl; 
    cout<<"REV : "<<endl; 
    vector<int> :: iterator itr2 = v1.end( ); 
    while(itr2!=v1.begin( ))
    {
        itr2--; 
        cout<<*itr2<<endl; 
    }
    cout<<"REV"<<endl; 
    vector<int> :: reverse_iterator itr3 = v1.rbegin( );
    while(itr3!=v1.rend( ))
    {
        cout<<*itr3<<endl; 
        itr3++; 
    } 
    cout<<endl; 
    vector<int> :: iterator itr4 = v1.begin( ); 
    while(itr4!=v1.end( ))
    {
        *itr4 = *itr4 + 10; 
        itr4++; 
    }
    cout<<endl; 
    cout<<"Modified element : "; 
    itr1 = v1.begin( ); 
    while(itr1!=v1.end( ))
    {
        cout<<*itr1<<endl; 
        itr1++; 
    }
    cout<<endl; 
    vector<int> :: const_iterator itr5 = v1.cbegin( );
    while(itr5!=v1.end( ))
    {
        cout<<*itr5<<endl; 
        itr5++; 
    } 
    return 0;
}
