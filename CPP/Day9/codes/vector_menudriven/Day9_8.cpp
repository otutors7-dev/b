#include <iostream>
#include <vector>
using namespace std;
// course(cid , name , fees)
class Course
{
private:
    int cid;
    string name;
    double fees;

public:
    Course(void)
    {
    }
    Course(int cid, string name, double fees) : cid(cid), name(name), fees(fees)
    {
    }
    void accept(void)
    {
        cout << "cid : ";
        cin >> cid;
        cout << "Name : ";
        cin >> name;
        cout << "Fees : ";
        cin >> fees;
    }
    void display(void)
    {
        cout << "Cid : " << cid << endl;
        cout << "Name : " << name << endl;
        cout << "Fees : " << fees << endl;
    }
    int getCid(void)
    {
        return this->cid;
    }
};
// student(roll , name , vector<Course*>course_taken )
class Student
{
private:
    int roll;
    string name;
    vector<Course *> course_taken;

public:
    Student(void) : roll(0), name("")
    {
    }
    Student(int roll, string name) : roll(roll), name(name)
    {
    }
    void accept(void)
    {
        cout << "Roll : ";
        cin >> roll;
        cout << "Name : ";
        cin >> name;
    }
    void display(void)
    {
        cout << "Roll : " << roll << endl;
        cout << "Name : " << name << endl;
    }
    int getRoll(void)
    {
        return this->roll;
    }
    void addCourse(Course *course)
    {
        course_taken.push_back(course);
    }
    vector<Course *> &getCourseTaken()
    {
        return this->course_taken;
    }
};
int menu()
{
    int choice;
    cout << "**********************************************" << endl;
    cout << "0. EXIT" << endl;
    cout << "1. Add Course" << endl;
    cout << "2. Display All Courses" << endl;
    cout << "3. Add Student" << endl;
    cout << "4. Display All Students" << endl;
    cout << "5. Purchase a Course" << endl;
    cout << "6. Display all students with their course taken" << endl;
    cout << "7. Display courses taken by the specific student" << endl;
    cout << "Enter your choice - ";
    cin >> choice;
    cout << "**********************************************" << endl;

    return choice;
}
void addDummyCourses(vector<Course *> &course_list)
{
    course_list.push_back(new Course(1, "C++", 5000));
    course_list.push_back(new Course(2, "Java", 7000));
    course_list.push_back(new Course(3, "Python", 7000));
    course_list.push_back(new Course(4, "DSA", 6000));
}
void displayAllCourses(vector<Course *> &course_list)
{
    for (int i = 0; i < course_list.size(); i++)
    {
        course_list[i]->display();
    }
}
void addDummyStudents(vector<Student *> &student_list)
{
    student_list.push_back(new Student(1, "Anil"));
    student_list.push_back(new Student(2, "Nilesh"));
    student_list.push_back(new Student(3, "Aditya"));
    student_list.push_back(new Student(4, "Rahul"));
    student_list.push_back(new Student(5, "Amar"));
    student_list.push_back(new Student(6, "Pratik"));
}
void purchaseCourse(vector<Course*>&course_list, vector<Student*> &student_list)  
{
    bool found = false; 
    int roll; 
    cout<<"Enter the roll : "; 
    cin>>roll; 
    for(int i = 0 ; i < student_list.size( ) ; i++)
    {
        if(roll == student_list[i]->getRoll( ))
        {
            found = true; 
            displayAllCourses(course_list); 
            int cid; 
            cout<<"Enter the cid : "; 
            cin>>cid; 
            for(int j = 0 ; j < course_list.size( ) ; j++)
            {
                if(cid == course_list[j]->getCid( ))
                {
                    student_list[i]->addCourse(course_list[j]); 
                    break; 
                }
            } 
            break; 
        }
    }
    if(!found)
      cout<<"Student not found"<<endl; 

}
void displayAllStudentsAlongWithCourseTaken(vector<Student*> &student_list) 
{
    for(int i = 0 ; i < student_list.size( ) ; i++)
    {
        student_list[i]->display( ); 
        displayAllCourses(student_list[i]->getCourseTaken()); 
    }
}
void courseTakenBySpecificStudent(vector<Student*> &student_list)  
{
    int roll; 
    cout<<"Roll : "; 
    cin>>roll; 
    for(int i = 0 ; i < student_list.size( ); i++)
    {
        if(roll == student_list[i]->getRoll( ))
        {
            student_list[i]->display( ); 
            displayAllCourses(student_list[i]->getCourseTaken( ) ); 
        }
    }
}
int main()
{
    vector<Student *> student_list;
    vector<Course *> course_list;
    int choice;
    while ((choice = ::menu()) != 0)
    {
        switch (choice)
        {
        case 1:
            addDummyCourses(course_list);
            break;
        case 2:
            displayAllCourses(course_list);
            break;
        case 3:
            addDummyStudents(student_list);
            break; 
        case 4:
            for(int i = 0 ; i < student_list.size( ) ; i++)
            {
                student_list[i]->display( ); 
            } 
        break; 
        case 5: 
        purchaseCourse(course_list, student_list); 
        break; 
        case 6: 
        displayAllStudentsAlongWithCourseTaken(student_list); 
        break; 
        case 7: 
        courseTakenBySpecificStudent(student_list); 
        default:
            break;
        }
    }
    return 0;
}
