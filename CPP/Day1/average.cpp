#include<iostream>
using namespace std;
int main()
{
    double n1,n2,n3,sum=0,avg;
    cout<<"Enter number one\n";
    cin>>n1;
    cout<<"Enter number second\n";
    cin>>n2;
    cout<<"Enter number three\n";
    cin>>n3;
    sum=n1+n2+n3;
    avg=sum/3;
    cout<<"Average of three numbers are = \n"<<avg;

}