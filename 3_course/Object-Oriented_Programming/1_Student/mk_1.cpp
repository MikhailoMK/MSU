#include <bits/stdc++.h>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <windows.h>
using namespace std;

template<typename S, typename I>
class Student {
public:
    S name, surname, patronymic, direction, sport, address, phone;
    I birth_year, age, course;

    Student(S surname, S name, S patronymic, I birth_year, S direction, I age, S sport, S address, S phone, I course) : name(name), surname(surname), patronymic(patronymic), birth_year(birth_year), direction(direction), age(age), sport(sport), address(address), phone(phone), course(course) {}
    Student() {}

    static void PrintAll(vector<Student>& Students)
    {
        ofstream file("Stud.txt");
        for(int i = 0; i < Students.size(); i++)
        {
            cout << Students[i].surname << ' ' << Students[i].name << ' ' << Students[i].patronymic << ' ' << Students[i].birth_year << ' ' << Students[i].direction << ' ' << Students[i].age << ' ' << Students[i].sport << ' ' << Students[i].address << ' ' << Students[i].phone << ' ' << Students[i].course << '\n';
            file << Students[i].surname << ' ' << Students[i].name << ' ' << Students[i].patronymic << ' ' << Students[i].birth_year << ' ' << Students[i].direction << ' ' << Students[i].age << ' ' << Students[i].sport << ' ' << Students[i].address << ' ' << Students[i].phone << ' ' << Students[i].course << '\n';
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
    }

    static void PrintSingle(vector<Student>& Students, int i)
    {
        cout << Students[i].surname << ' ' << Students[i].name << ' ' << Students[i].patronymic << ' ' << Students[i].birth_year << ' ' << Students[i].direction << ' ' << Students[i].age << ' ' << Students[i].sport << ' ' << Students[i].address << ' ' << Students[i].phone << ' ' << Students[i].course << '\n';
        ofstream file("Stud.txt");
        file << Students[i].surname << ' ' << Students[i].name << ' ' << Students[i].patronymic << ' ' << Students[i].birth_year << ' ' << Students[i].direction << ' ' << Students[i].age << ' ' << Students[i].sport << ' ' << Students[i].address << ' ' << Students[i].phone << ' ' << Students[i].course << '\n';
        file.close();
    }

    static void PrintStudent(const Student& A)
    {
        cout << A.surname << ' ' << A.name << ' ' << A.patronymic << ' ' << A.birth_year << ' ' << A.direction << ' ' << A.age << ' ' << A.sport << ' ' << A.address << ' ' << A.phone << ' ' << A.course << '\n';
        ofstream file("Stud.txt");
        file << A.surname << ' ' << A.name << ' ' << A.patronymic << ' ' << A.birth_year << ' ' << A.direction << ' ' << A.age << ' ' << A.sport << ' ' << A.address << ' ' << A.phone << ' ' << A.course << '\n';
        file.close();
        cout << "-----------------------------------------------------------------------\n";
    }

    static void AddStudent(vector<Student>& Students, Student student)
    {
        Students.push_back(student);
    }

    static void InputAndAddStudent(vector<Student>& Students)
    {
        Student<string, int> student;

        cout << "�������: "; cin >> student.surname;
        cout << "���: "; cin >> student.name;
        cout << "��������: "; cin >> student.patronymic;
        cout << "��� ��������: "; cin >> student.birth_year;
        cout << "�������������: "; cin >> student.direction;
        cout << "�������: "; cin >> student.age;
        cout << "�����: "; cin >> student.sport;
        cout << "�����: "; cin >> student.address;
        cout << "�������: "; cin >> student.phone;
        cout << "����: "; cin >> student.course;

        Students.push_back(student);
    }

    static void InputAndAddStudentViaFile(vector<Student>& Students)
    {
        Student<string, int> student;

        ifstream file("input.txt");
        if(file.is_open())
        {
            getline(file, student.surname, ',');
            getline(file, student.name, ',');
            getline(file, student.patronymic, ',');
            file >> student.birth_year; file.ignore();
            getline(file, student.direction, ',');
            file >> student.age; file.ignore();
            getline(file, student.sport, ',');
            getline(file, student.address, ',');
            getline(file, student.phone, ',');
            file >> student.course;

            Students.push_back(student);
        }
        else
        {
            cout << "������ ��� �������� �����!" << endl;
        }
    }

    static void RemoveStudent(vector<Student>& Students, int IndexOfStudent)
    {
        Students.erase(Students.begin() + IndexOfStudent);
    }
    static bool CompareStudentsBySurname(const Student& A, const Student& B)
    {
        return A.surname < B.surname;
    }

    static bool CompareStudentsByName(const Student& A, const Student& B)
    {
        return A.name < B.name;
    }

    static bool CompareStudentsByPat(const Student& A, const Student& B)
    {
        return A.patronymic < B.patronymic;
    }

    static bool CompareStudentsByYear(const Student& A, const Student& B)
    {
        return A.birth_year < B.birth_year;
    }

    static bool CompareStudentsByDir(const Student& A, const Student& B)
    {
        return A.direction < B.direction;
    }

    static bool CompareStudentsByAge(const Student& A, const Student& B)
    {
        return A.age < B.age;
    }

    static bool CompareStudentsBySport(const Student& A, const Student& B)
    {
        return A.sport < B.sport;
    }

    static bool CompareStudentsByAddr(const Student& A, const Student& B)
    {
        return A.address < B.address;
    }

    static bool CompareStudentsByPhone(const Student& A, const Student& B)
    {
        return A.phone < B.phone;
    }

    static bool CompareStudentsByCourse(const Student& A, const Student& B)
    {
        return A.course < B.course;
    }

    static void SortStudents(vector<Student>& Students)
    {
        cout << "�������� ��� ����� �����������: \n"
        << "1 - ������� \n"
        << "2 - ��� \n"
        << "3 - �������� \n"
        << "4 - ��� �������� \n"
        << "5 - ������������� \n"
        << "6 - ������� \n"
        << "7 - ����� \n"
        << "8 - ����� \n"
        << "9 - ������� \n"
        << "10 - ���� \n"
        << "�������� ��������: ";

        int vibor;
        cin >> vibor;

        switch(vibor)
        {
            case 1:
                sort(Students.begin(), Students.end(), CompareStudentsBySurname); break;
            case 2:
                sort(Students.begin(), Students.end(), CompareStudentsByName); break;
            case 3:
                sort(Students.begin(), Students.end(), CompareStudentsByPat); break;
            case 4:
                sort(Students.begin(), Students.end(), CompareStudentsByYear); break;
            case 5:
                sort(Students.begin(), Students.end(), CompareStudentsByDir); break;
            case 6:
                sort(Students.begin(), Students.end(), CompareStudentsByAge); break;
            case 7:
                sort(Students.begin(), Students.end(), CompareStudentsBySport); break;
            case 8:
                sort(Students.begin(), Students.end(), CompareStudentsByAddr); break;
            case 9:
                sort(Students.begin(), Students.end(), CompareStudentsByPhone); break;
            case 10:
                sort(Students.begin(), Students.end(), CompareStudentsByCourse); break;
        }
    }

    static void UpdateStudentSurname(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].surname = CodeWord;
    }
    static void UpdateStudentName(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].name = CodeWord;
    }
    static void UpdateStudentPatronymic(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].patronymic = CodeWord;
    }
    static void UpdateStudentBirthYear(vector<Student>& Students, int index, I CodeWord)
    {
        Students[index].birth_year = CodeWord;
    }
    static void UpdateStudentDirection(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].direction = CodeWord;
    }
    static void UpdateStudentAge(vector<Student>& Students, int index, I CodeWord)
    {
        Students[index].age = CodeWord;
    }
    static void UpdateStudentSport(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].sport = CodeWord;
    }
    static void UpdateStudentAddress(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].address = CodeWord;
    }
    static void UpdateStudentPhone(vector<Student>& Students, int index, S CodeWord)
    {
        Students[index].phone = CodeWord;
    }
    static void UpdateStudentCourse(vector<Student>& Students, int index, I CodeWord)
    {
        Students[index].course = CodeWord;
    }
    static void UpdateStudent(vector<Student>& Students)
    {
        cout << "�������� ������ ��������: \n";
        for(int i = 0; i < Students.size(); i++)
        {
            cout << i + 1; cout << ' '; Student<string, int> :: PrintSingle(Students, i);
        }
        cout << "������� ������: ";
        int IndexOfChosenStudentForUpdating; cin >> IndexOfChosenStudentForUpdating;

        cout << "�������� ��� ����� ������: \n"
        << "1 - ������� \n"
        << "2 - ��� \n"
        << "3 - �������� \n"
        << "4 - ��� �������� \n"
        << "5 - ������������� \n"
        << "6 - ������� \n"
        << "7 - ����� \n"
        << "8 - ����� \n"
        << "9 - ������� \n"
        << "10 - ���� \n"
        << "�������� ��������: ";

        int vibor;
        cin >> vibor;

        S CodeString; I CodeInt;

        switch(vibor)
        {
            case 1:
                cout << "������� �������: "; cin >> CodeString; Student<string, int> :: UpdateStudentSurname(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 2:
               cout << "������� ���: "; cin >> CodeString; Student<string, int> :: UpdateStudentName(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 3:
               cout << "������� ��������: "; cin >> CodeString; Student<string, int> :: UpdateStudentPatronymic(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 4:
               cout << "������� ��� ��������: "; cin >> CodeInt; Student<string, int> :: UpdateStudentBirthYear(Students, IndexOfChosenStudentForUpdating - 1, CodeInt); break;
            case 5:
               cout << "������� �������������: "; cin >> CodeString; Student<string, int> :: UpdateStudentDirection(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 6:
               cout << "������� �������: "; cin >> CodeInt; Student<string, int> :: UpdateStudentAge(Students, IndexOfChosenStudentForUpdating - 1, CodeInt); break;
            case 7:
               cout << "������� �����: "; cin >> CodeString; Student<string, int> :: UpdateStudentSport(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 8:
               cout << "������� �����: "; cin >> CodeString; Student<string, int> :: UpdateStudentAddress(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 9:
               cout << "������� �������: "; cin >> CodeString; Student<string, int> :: UpdateStudentPhone(Students, IndexOfChosenStudentForUpdating - 1, CodeString); break;
            case 10:
               cout << "������� ����: "; cin >> CodeInt; Student<string, int> :: UpdateStudentCourse(Students, IndexOfChosenStudentForUpdating - 1, CodeInt); break;
        }
    }
    static vector<Student*> FindStudentBySurname(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        ofstream file("Stud.txt");
        cout << "����� '" << CodeWord << "' �������: " << '\n';
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->surname == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByName(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->name == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        cout << "-----------------------------------------------------------------------\n";
        file.close();
        return foundStudents;
    }
    static vector<Student*> FindStudentByPatronymic(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->patronymic == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByBirthYear(vector<Student>& Students, I CodeWord)
    {
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        vector<Student*> foundStudents;
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->birth_year == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << '\n' << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByDirection(vector<Student>& Students, S CodeWord)
    {
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        vector<Student*> foundStudents;
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->direction == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << '\n' << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByAge(vector<Student>& Students, I CodeWord)
    {
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        vector<Student*> foundStudents;
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->age == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentBySport(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->sport == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByAddress(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->address == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByPhone(vector<Student>& Students, S CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->phone == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static vector<Student*> FindStudentByCourse(vector<Student>& Students, I CodeWord)
    {
        vector<Student*> foundStudents;
        cout << "����� '" << CodeWord <<"' �������: " << '\n';
        ofstream file("Stud.txt");
        for(typename vector<Student> :: iterator it = Students.begin(); it != Students.end(); ++it)
        {
            if(it->course == CodeWord)
            {
                file << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                cout << it->surname << ' ' << it->name << ' ' << it->patronymic << ' ' << it->birth_year << ' ' << it->direction << ' ' << it->age << ' ' << it->sport << ' ' << it->address << ' ' << it->phone << ' ' << it->course << '\n';
                foundStudents.push_back(&(*it));
            }
        }
        file.close();
        cout << "-----------------------------------------------------------------------\n";
        return foundStudents;
    }
    static Student* FindStudent(vector<Student>& Students)
    {
        cout << "�������� ��� ������: \n"
        << "1 - ������� \n"
        << "2 - ��� \n"
        << "3 - �������� \n"
        << "4 - ��� �������� \n"
        << "5 - ������������� \n"
        << "6 - ������� \n"
        << "7 - ����� \n"
        << "8 - ����� \n"
        << "9 - ������� \n"
        << "10 - ���� \n"
        << "�������� ��������: ";

        int vibor;
        cin >> vibor;
        S CodeString;
        I CodeInt;
        switch(vibor)
        {
            case 1:
                cout << "������� �������: "; cin >> CodeString; Student<string, int> :: FindStudentBySurname(Students, CodeString); break;
            case 2:
               cout << "������� ���: "; cin >> CodeString; Student<string, int> :: FindStudentByName(Students, CodeString); break;
            case 3:
               cout << "������� ��������: "; cin >> CodeString; Student<string, int> :: FindStudentByPatronymic(Students, CodeString); break;
            case 4:
               cout << "������� ��� ��������: "; cin >> CodeInt; Student<string, int> :: FindStudentByBirthYear(Students, CodeInt); break;
            case 5:
               cout << "������� �������������: "; cin >> CodeString; Student<string, int> :: FindStudentByDirection(Students, CodeString); break;
            case 6:
               cout << "������� �������: "; cin >> CodeInt; Student<string, int> :: FindStudentByAge(Students, CodeInt); break;
            case 7:
               cout << "������� �����: "; cin >> CodeString; Student<string, int> :: FindStudentBySport(Students, CodeString); break;
            case 8:
               cout << "������� �����: "; cin >> CodeString; Student<string, int> :: FindStudentByAddress(Students, CodeString); break;
            case 9:
               cout << "������� �������: "; cin >> CodeString; Student<string, int> :: FindStudentByPhone(Students, CodeString); break;
            case 10:
               cout << "������� ����: "; cin >> CodeInt; Student<string, int> :: FindStudentByCourse(Students, CodeInt); break;
        }
        return NULL;
    }
};

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    vector<Student<string, int> > Students;
    Student<string, int> Mikhail("�������", "������", "����������", 2003, "����", 20, "�����������", "9-�� ��", "934617277", 3); Student<string, int> :: AddStudent(Students, Mikhail);

    int MainMenu;
    do
    {
        cout << "\n�������� ��������: \n"
        << "1 - ������� ���� ��������� \n"
        << "2 - ������� �������� �� ������� \n"
        << "3 - ������� �������� �� ������� \n"
        << "4 - ������ ���������� � �������� � �������� ��� \n"
        << "5 - ����������� \n"
        << "6 - �������� ���������� � �������� \n"
        << "7 - ����� �������� \n"
        << "8 - �������� �������� �� ���������� �� ����� \n"
        << "9 - ����� \n"
        << "�������� �������: ";

        cin >> MainMenu; cout << "\n-----------------------------------------------------------------------\n";

        switch (MainMenu)
        {
            case 1:
            {
                Student<string, int> :: PrintAll(Students);
                break;
            }
            case 2:
            {
                cout << "�������� ������ ��������: \n";
                for(int i = 0; i < Students.size(); i++)
                {
                    cout << i + 1; cout << ' '; Student<string, int> :: PrintSingle(Students, i);
                }
                cout << "-----------------------------------------------------------------------\n";
                cout << "������� ������: "; int IndexToShow; cin >> IndexToShow;
                cout << "-----------------------------------------------------------------------\n";
                Student<string, int> :: PrintSingle(Students, IndexToShow - 1); cout << "-----------------------------------------------------------------------\n";
                break;
            }
            case 3:
            {
                cout << "�������� ������ ��������: \n";
                for(int i = 0; i < Students.size(); i++)
                {
                    cout << i + 1; cout << ' '; Student<string, int> :: PrintSingle(Students, i);
                }

                cout << "������� ������: "; int IndexToRemove; cin >> IndexToRemove;
                cout << "----------------------------------------------------\n";
                Student<string, int> :: RemoveStudent(Students, IndexToRemove - 1);
                Student<string, int> :: PrintAll(Students);
                break;
            }
            case 4:
            {
                Student<string, int> :: InputAndAddStudent(Students);
                Student<string, int> :: PrintAll(Students);
                break;
            }
            case 5:
            {
                Student<string, int> :: SortStudents(Students);
                Student<string, int> :: PrintAll(Students);
                break;
            }
            case 6:
            {
                Student<string, int> :: UpdateStudent(Students);
                Student<string, int> :: PrintAll(Students);
                break;
            }
            case 7:
            {
                Student<string, int> :: FindStudent(Students);
                break;
            }
            case 8:
            {
                cout << "������� '�' ��� ������� �����, ��� '�' ���� �� ������. [� / �] \n";
                char Answer; cin >> Answer;
                if(Answer == '�' || Answer == '�')
                {
                    Student<string, int> :: InputAndAddStudentViaFile(Students);
                    Student<string, int> :: PrintAll(Students);
                }
                else
                {
                    cout << "������� ���������";
                }
                break;
            }
            case 9:
            {
                return 0;
            }

            default:
                return 0;
                break;
        }
    } while (MainMenu != 9);
}
