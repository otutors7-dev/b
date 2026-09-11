#include<iostream> 
#define SQR(x) x * x 
using namespace std; 
// inline functions -- replaced at their calls by the compiler.
//  - execution is faster (no function activation record created/destroyed)
//  - still type-safe (param types are given)
// compiler only replace inline functions when they are short and simple.
//  - not when function contains loops, switch, nested fn calls, ...
//  - if functions contains loops, ..., then compiler simply ignore inline keyword.

inline int sqr(int n )
{
    return n * n; 
}
int main()
{
    cout<<"Square : "<<SQR(2)<<endl;
    cout<<"Square : "<<SQR(2 + 3)<<endl; 
    int res = sqr(2); // 2 * 2  
    cout<<"res : " <<res<<endl; 
    return 0;
}
