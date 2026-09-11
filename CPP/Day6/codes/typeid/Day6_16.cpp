#include<iostream> 
using namespace std; 
class Shape 
{
    protected: 
    float area; 
    public: 
    virtual void calculateArea( void ) = 0; //overrided method  
    void printArea( void ) // non-overriden function 
    {
        cout<<"Area : "<<area<<endl; 
    }
}; 
class Rectangle : public Shape 
{
    private: 
    float length; 
    float breadth; 
    public: 
    void setLength(float length) // non-overrided 
    {
        this->length = length; 
    }
    void setBreadth(float breadth) //non-overrided 
    {
        this->breadth = breadth; 
    }
    void calculateArea( void ) // overrided 
    {
        this->area = this->length * this->breadth; 
    }
}; 
class Math
{
    public: 
    const static float PI; 
    static float pow(float base , int index)
    {
        float result = 1.0f; 
        for(int count = 1 ; count <= index ; count++)
        {
            result = result * base; 
        }
        return result; 
    }
}; 
const float Math :: PI = 3.14f; 
class Circle : public Shape
{
    private: 
    float radius; 
    public: 
    void setRadius(float radius) //non-overrided 
    {
        this->radius = radius; 
    }
    void calculateArea( void )//overrided 
    {
        this->area = Math::PI * Math::pow(this->radius,2); 
    }
}; 
int menuList( void )
{
    int choice; 
    cout<<"0.Exit"<<endl; 
    cout<<"1.Rectangle"<<endl;
    cout<<"2.Circle"<<endl;
    cout<<"Enter the choice : "; 
    cin>>choice; 
    return choice;  
}
//Global functions 
void acceptRecord(Shape *shape)
{
    if(typeid(*shape) == typeid(Rectangle))
    {
        Rectangle *rect = (Rectangle*)shape; //downcasting 
        float length , breadth; 
        cout<<"Length : "; 
        cin>>length; 
        rect->setLength(length); 

        cout<<"Breadth : "; 
        cin>>breadth; 
        rect->setBreadth(breadth); 
    }
    else if(typeid(*shape) == typeid(Circle))
    {
        Circle *c = (Circle*)shape;//downcasting
        float radius; 
        cout<<"Radius : "; 
        cin>>radius; 
        c->setRadius(radius);   
    }
    else 
      cout<<"Invalid Shape"<<endl; 
}
void printRecord(Shape *shape)
{
    shape->printArea( ); 
}
int main()
{
    int choice; 
    while((choice = ::menuList())!=0)
    {
        Shape *shape = NULL; 
        switch (choice)
        {
        case 1: 
            shape = new Rectangle( ); //upcasting 
            break;
        case 2: 
            shape = new Circle( ); //upcasting 
            break; 
        }
        if(shape!=NULL)
        {
            ::acceptRecord(shape); 
            shape->calculateArea( ); 
            ::printRecord(shape); 
            delete shape; 
            shape = NULL; 
        }
    }
    return 0;
}
