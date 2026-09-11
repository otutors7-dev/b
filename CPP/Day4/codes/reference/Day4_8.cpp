#include<iostream> 
using namespace std;
void Swap(int &n1 , int &n2)
{
    int temp = n1; 
    n1 = n2; 
    n2 = temp; 
}
int main()
{
    int a = 10 , b = 20; 
    Swap(a,b);
    cout<<"a : "<<a<<endl;
    cout<<"b : "<<b<<endl;  
    return 0;
}

int main8()
{
    int a = 10; 
    int &b = a;
    //int * const p = &a;  
    return 0;
}

int main7()
{
    //int &ref; // NOT OK 
    //int &ref = NULL; //NOT OK 
    //int &ref = 10; // NOT OK 
    return 0;
}

int main6()
{
    int num1 = 10; 
    int &num2 = num1; 
    int num3 = 30; 
    num2 = num3; 
    num1++; 
    num2++; 
    num3++; 
    cout<<num1<<endl;
    cout<<num2<<endl; 
    cout<<num3<<endl; 
    return 0;
}

int main5()
{
    
    int num1 = 10; // referent 
    int &num2 = num1; // reference 
    int &num3 = num2; // reference 
    num1++; 
    num2++;
    num3++;  
    cout<<num1<<" "<<&num1<<endl;
    cout<<num2<<" "<<&num2<<endl; 
    cout<<num3<<" "<<&num3<<endl; 
    return 0;
} 
int main4()
{
    //Reference is derived data type.
    //It alias or another name given to the exisiting memory location / object.
    int num1 = 10; // referent 
    int &num2 = num1; // reference 
    int &num3 = num1; // reference 
    num1++; 
    num2++;
    num3++;  
    cout<<num1<<" "<<&num1<<endl;
    cout<<num2<<" "<<&num2<<endl; 
    cout<<num3<<" "<<&num3<<endl; 
    return 0;
} 
int main3()
{
    //Reference is derived data type.
    //It alias or another name given to the exisiting memory location / object.
    int num1 = 10; // referent 
    int &num2 = num1; // reference 
    num1++; 
    num2++; 
    cout<<num1<<" "<<&num1<<endl;
    cout<<num2<<" "<<&num2<<endl; 
    return 0;
} 
int main2(int argc, char const *argv[])
{
    //Reference is derived data type.
    //It alias or another name given to the exisiting memory location / object.
    int num1 = 10; // referent 
    int &num2 = num1; // reference 
    cout<<num1<<" "<<&num1<<endl;
    cout<<num2<<" "<<&num2<<endl; 
    return 0;
}

int main1()
{
    int num1 = 10; 
    int num2 = num1;
    cout<<num1<<" "<<&num1<<endl;
    cout<<num2<<" "<<&num2<<endl; 
    return 0;
}

