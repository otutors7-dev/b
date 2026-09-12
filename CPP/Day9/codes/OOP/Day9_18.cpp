#include <iostream>
using namespace std;

namespace NShape
{
    enum ShapeType
    {
        EXIT,
        RECTANGLE,
        CIRCLE
    };
    class ArgumentException
    {
    private:
        const string message;

    public:
        ArgumentException(const string message) : message(message)
        {
        }
        const string &getMessage() const
        {
            return message;
        }
    };
    class Shape
    {
    protected:
        float area;

    public:
        Shape(void) throw() : area(0)
        {
        }
        virtual void calculateArea(void) throw() = 0;
        float getArea() const throw()
        {
            return this->area;
        }
        virtual ~Shape(void) throw() {}
    };
    class Rectangle : public Shape
    {
    private:
        float length;
        float breadth;

    public:
        Rectangle(void) throw() : length(0), breadth(0)
        {
        }
        void setLength(const float length)
        {
            if (length >= 0)
                this->length = length;
            else
                throw ArgumentException("Invalid Length");
        }
        void setBreadth(const float breadth)
        {
            if (breadth >= 0)
                this->breadth = breadth;
            else
                throw ArgumentException("Invalid breadth");
        }
        void calculateArea(void) throw()
        {
            this->area = this->length * this->breadth;
        }
    };
    class Math
    {
    public:
        static const float PI;

    public:
        static float power(float base, int index)
        {
            float result = 1;
            for (int i = 1; i <= index; i++)
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
        Circle( void ) throw( )  : radius( 0 )
        {   }
        void setRadius(const float radius)
        {
            if (radius >= 0)
                this->radius = radius;
            else
                throw ArgumentException("Invalid Radius");
        }
        void calculateArea(void) throw()
        {
            this->area = Math::PI * Math::power(this->radius, 2);
        }
    };
    class ShapeFactory
    {
    public:
        static Shape *getInstance(ShapeType choice)
        {
            Shape *ptrShape = NULL;
            switch (choice)
            {
            case RECTANGLE:
                ptrShape = new Rectangle();
                break;
            case CIRCLE:
                ptrShape = new Circle();
                break;
            }
            return ptrShape;
        }
    };
}
using namespace NShape;
void acceptRecord(Shape *ptrShape)
{
    if (dynamic_cast<Rectangle *>(ptrShape) != NULL)
    {
        Rectangle *ptrRectangle = (Rectangle *)ptrShape;
        float length;
        cout << "Length : ";
        cin >> length;
        ptrRectangle->setLength(length);

        float breadth;
        cout << "Breadth : ";
        cin >> breadth;
        ptrRectangle->setBreadth(breadth);
    }
    else
    {
        Circle *ptrCircle = dynamic_cast<Circle*>(ptrShape); 
        float radius; 
        cout<<"Radius : "; 
        cin>>radius; 
        ptrCircle->setRadius(radius); 
    }
}
void printRecord(Shape *ptrShape)
{
    string name = typeid(*ptrShape).name();
    cout << "Area of instance of " << name << "is : " << ptrShape->getArea() << endl;
}
ShapeType menu_list(void)
{
    int choice;
    cout << "0.Exit" << endl;
    cout << "1.Rectangle" << endl;
    cout << "2.Circle" << endl;
    cout << "Enter the choice : ";
    cin >> choice;
    return ShapeType(choice);
}
int main()
{
    try
    {
        ShapeType choice;
        while ((choice = ::menu_list()) != 0)
        {
            try
            {
                Shape *ptrShape = ShapeFactory::getInstance(choice);
                if (ptrShape != NULL)
                {
                    ::acceptRecord(ptrShape);
                    ptrShape->calculateArea();
                    ::printRecord(ptrShape);
                    delete ptrShape;
                }
            }
            catch (bad_alloc ex)
            {
                cout << "Insufficient memory" << endl;
            }
            catch (ArgumentException ex)
            {
                cout << ex.getMessage();
            }
        }
    }
    catch (...)
    {
        cout<<"Exception"<<endl; 
    }

    return 0;
}
