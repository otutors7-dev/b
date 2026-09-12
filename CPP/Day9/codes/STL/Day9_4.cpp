#include<iostream> 
#include<map> 
using namespace std; 
int main()
{
    //roll , marks 
    map<int,double> m1; 
    m1[4] = 77.77;
    m1[23] = 10.77; 
    m1[33] = 33.77;
    m1[56] = 88.77;
    m1[4] = 92.77;

    // int roll; 
    // double marks; 
    // cout<<"Enter the roll : "; 
    // cin>>roll; 
    // marks = m1[roll]; 
    // cout<<"Marks : "<<marks; 

    map<int,double> :: iterator itr = m1.begin( ); 
    while(itr!=m1.end( ))
    {
        cout<<itr->first<<" "<<itr->second<<endl; 
        itr++; 
    }
    return 0;
}
