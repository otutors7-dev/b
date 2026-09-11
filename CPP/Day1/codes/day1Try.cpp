#include <stdio.h>

class Employee{
    int age;
    int salary;

    public:
    void getvalues(){
        printf("Enter the age of the employee \n");
        scanf("%d",&this->age);
        printf("Enter the salary of the employee \n");
        scanf("%d", &this->salary);
        printf("Entries recorded!\n");
    }
    void printValues(){
        printf("The age of the employee is %d\n",this->age);
        printf("The salary of the employee is %d\n",this->salary);
    }

};

void selectMenu(int &choice){
    printf("0. Exit\n");
    printf("1. Print Values\n");
    printf("2. Accept Values\n");
    printf("Enter Your Choice\n");
    scanf("%d", &choice);
}
int main(){
    int choice;
    Employee emp;
    while(choice){
        selectMenu(choice);
        switch(choice)
        {
            case 1:
                emp.printValues();
                break;
            case 2:
                emp.getvalues();
                break;
        }

    }
    
    return 0;
}