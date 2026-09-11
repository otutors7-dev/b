#include<stdio.h>

struct Date
{
    int day;
    int month;
    int year;
    int c;

    void dateInit()
    {
        day=01;
        month=01;
        year=2000;
        printf("Initial date is %d-%d-%d\n",day,month,year);
    }

    void acceptDate()
    {
        printf("Enter day : ");
        scanf("%d",&day);
        printf("Enter month : ");
        scanf("%d",&month);
        printf("Enter year : ");
        scanf("%d",&year);

    }

    void printWholeDate()
    {
        printf("Date is %d - %d - %d\n",day,month,year);
       // printf("Day: %d",day);
    }

    int menu()
    {
        
        printf("0 : Exit\n"); 
        printf("1 : Edit Date\n");
        printf("2 : Edit Month\n");
        printf("3 : Edit Year\n");
        printf("Enter choice : \n");
        scanf("%d",&c);
        return c;
    }

     void changeDay()
     {
         printf("Enter New Day : \n");
         scanf("%d",&day);
     }

     void changeMonth()
    {
        printf("Enter New Month : \n");
        scanf("%d",&month);
    }

    void changeYear()
    {
        printf("Enter New Year : \n");
        scanf("%d",&year);
    }

};

int main()
{
    Date d1;
    
     d1.dateInit();
     int c=d1.menu();
    // d1.acceptDate();
    //  d1.printWholeDate();
    // d1.changeMonth();
    //  d1.printWholeDate();
    // d1.changeYear();
    //  d1.printWholeDate();
while(c!=0)
{
    switch (c)
    {
    case 1:
        printf("Enter New Day : \n");
         d1.changeDay();
         d1.printWholeDate();
         d1.menu();
        break;
    case 2:
        printf("Enter New Month : \n");
         d1.changeMonth();
         d1.printWholeDate();
         d1.menu();
         break;
    case 3:
         printf("Enter New Year : \n");
         d1.changeYear();
         d1.printWholeDate();
         d1.menu();
         break;
    
    default:
      printf("Invalid input");
      d1.printWholeDate();
      d1.menu();

        break;
    }
    
}
printf("Exit");
}