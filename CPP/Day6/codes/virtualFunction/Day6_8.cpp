#include<iostream> 
using namespace std; 
class Rectangle 
{
    private: 
    float length; 
    float breadth;
    float area;  
    public: 
    Rectangle( void ) : length( 0 ) , breadth( 0 )
    {   }
    void acceptRecord( void )
    {
        cout<<"Length : "; 
        cin>>length; 
        cout<<"Breadth : "; 
        cin>>breadth; 
    }
    void calculateArea( void)
    {
        this->area = this->length * this->breadth; 
    }
    void printRecord( void )
    {
        cout<<"Area : "<<area<<endl; 
    }
}; 
class Math
{
   public: 
   static const float PI;
   //                    3.0            2       
   static float pow(float base , int index)
   {
        float res = 1.0f; 
        for(int count = 1 ; count <= index ; count++)
        {
            res = res * base; 
        }
        return res; 
   } 
}; 
const float Math :: PI = 3.14f; 
class Circle 
{
    private: 
    float area; 
    float radius; 
    public: 
    Circle( void ) : radius(0.0)
    {   }
    void acceptRecord(void )
    {
        cout<<"Radius : "; 
        cin>>radius; 
    }
    void calculateArea( void)
    {
        this->area = Math::PI * Math::pow(this->radius,2);  
    }
     void printRecord( void )
    {
        cout<<"Area : "<<area<<endl; 
    }
}; 
int main()
{
    Circle c; 
    c.acceptRecord( ); 
    c.calculateArea( ); 
    c.printRecord( ); 
    return 0;
}

int main1()
{
    Rectangle rect; 
    rect.acceptRecord( ); 
    rect.calculateArea( ); 
    rect.printRecord( ); 
    return 0;
}
