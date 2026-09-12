#include<iostream> 
#include<set> 
using namespace std; 
int main()
{
    set<int> s1; // allows only unique elements  
    s1.insert(10);
    s1.insert(20); 
    s1.insert(30);
    s1.insert(40);
    s1.insert(10);

    set<int> :: iterator itr = s1.begin( ); 
    while(itr!=s1.end( ))
    {
        cout<<*itr <<endl; 
        itr++; 
    }
    return 0;
}
