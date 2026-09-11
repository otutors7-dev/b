#include<stack> 
#include<iostream>
// built-in stack implemented using linkedlist 
/*
    Built-in stack 
    - void push(T val); 
    - void pop( ); 
    - T top( ); // like our peek()
    - empty( ); 
*/


using namespace std; 
int main()
{
    stack<int> stk; 
    stk.push(10);
    stk.push(20); 
    stk.push(30);
    stk.push(40);
    stk.push(50);
    while(!stk.empty( ))
    {
        int ele = stk.top( ); 
        stk.pop( ); 
        cout<<"Ele : "<<ele<<endl; 
    }
    return 0;
}
