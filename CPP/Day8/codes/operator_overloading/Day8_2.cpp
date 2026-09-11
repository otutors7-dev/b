#include <iostream>
using namespace std;
class Point
{
private:
    int xPos;
    int yPos;

public:
    Point(void) : xPos(0), yPos(0)
    {
    }
    Point(int xPos, int yPos) : xPos(xPos), yPos(yPos) 
    {
    }
    void printRecord(void)
    {
        cout << "xPos : " << xPos << endl;
        cout << "yPos : " << yPos << endl;
    }
};
int main()
{
    Point pt1(10, 20);
    Point pt2(30, 40);
    // Point pt3 = pt1 + pt2;
    return 0;
}
