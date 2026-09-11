#include <iostream>
using namespace std;

class Complex
{
protected:
    int real;
    int imag;
    Complex(void)
    {
        cout << "Complex(void)" << endl;
        this->real = 0;
        this->imag = 0;
    }

public:
    void acceptRecord(void)
    {
        cout << "Real : ";
        cin >> real;
        cout << "Imag : ";
        cin >> imag;
    }
    void printRecord(void)
    {
        cout << "Real : " << real << endl;
        cout << "imag : " << imag << endl;
    }
};
int main()
{
    return 0;
}
