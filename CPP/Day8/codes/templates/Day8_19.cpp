#include <iostream>
using namespace std;
class StackOverFlowException
{
private:
    string message;

public:
    StackOverFlowException(string message)
    {
        this->message = message;
    }
    string getMessage(void)
    {
        return this->message;
    }
};
class StackUnderFlowException
{
private:
    string message;

public:
    StackUnderFlowException(string message)
    {
        this->message = message;
    }
    string getMessage(void)
    {
        return this->message;
    }
};
class Stack
{
private:
    int size;
    int *arr;
    int top;

public:
    Stack(int size)
    {
        this->size = size;
        this->arr = new int[this->size];
        this->top = -1;
    }
    bool isFull(void)
    {
        return this->top == this->size - 1;
    }
    bool isEmpty(void)
    {
        return this->top == -1;
    }
    void push(int data)
    {
        if (this->isFull())
            throw StackOverFlowException("Stack is Full");
        this->top++;
        this->arr[top] = data;
    }
    void pop(void)
    {
        if (this->isEmpty())
            throw StackUnderFlowException("Stack is Empty");
        this->top--;
    }
    int peek(void)
    {
        if (this->isEmpty())
            throw StackUnderFlowException("Stack is empty");
        return this->arr[this->top];
    }
    ~Stack(  )
    {
        if(this->arr!=NULL)
        {
            delete[] this->arr; 
            this->arr = NULL; 
        }
    }
};
void acceptData(int &number)
{
    cout << "Ele  : ";
    cin >> number;
}
void printData(int number)
{
    cout << "Number : " << number << endl;
}
int menuList(void)
{
    int choice;
    cout << "0.Exit" << endl;
    cout << "1.Push" << endl;
    cout << "2.Pop" << endl;
    cout << "Enter the choice : ";
    cin >> choice;
    return choice;
}
int main()
{
    int choice;
    Stack stk(5);
    int data;
    try
    {
        while ((choice = ::menuList()) != 0)
        {
            try
            {
                switch (choice)
                {
                case 1:
                    ::acceptData(data);
                    stk.push(data);
                    break;
                case 2:
                    data = stk.peek();
                    stk.pop();
                    printData(data);
                    break;
                }
            }
            catch (StackOverFlowException &ex)
            {
                cout << ex.getMessage() << endl;
            }
            catch (StackUnderFlowException &ex)
            {
                cout << ex.getMessage() << endl;
            }
        }
    }
    catch (...)
    {
        cout<<"Exception handled"<<endl; 
    }

    return 0;
}
