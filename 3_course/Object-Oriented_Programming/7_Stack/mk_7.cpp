#include <iostream>
#include <string>
#include <algorithm>
#include <sstream>
#include <windows.h>
using namespace std;

template <typename T>

class Stack
{
    struct Element{T val; Element* previous;};
    private:
        Element *last;
    public:

    Stack() : last(nullptr) {}

    void push(T value_to_push)
    {
        Element *record = new Element;
        record->val = value_to_push;
        if(last == nullptr)
        {
            record->previous = nullptr;
            last = record;
        }
        else
        {
            record->previous = last;
            last = record;
        }
    }

    void show()
    {
        string s = "";
        Element *container = last;
        ostringstream stream;
        while(container != nullptr){
            stream << container->val << '\n';
            container = container->previous;
        }
        cout << stream.str();
    }

    void pop()
    {
        Element *del = last;
        last = del->previous;
        delete del;
    }

    T top()
    {
        cout << last->val << '\n';
        return last->val;
    }
};


int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Stack<double> St;
    St.push(7);
    St.push(9);
    St.push(3);
    bool run = true;
    int oper = 0;
    while(run){
        cout << "----------------------------------------\n"
        << "1. ��������\n"
        << "2. ��������� �������\n"
        << "3. �������\n"
        << "4. ��������\n"
        << "5. ����� �� ���������\n"
        << "----------------------------------------\n"
        << "�������� ��������: ";
        cin >> oper;
        switch (oper)
        {
            case 1:
                cout << "������� ������ � �������� ��� ����������: ";
                double n;
                cin >> n;
                St.push(n);
                St.show();
                break;
            case 2:
                St.top();
                break;
            case 3:
                St.pop();
                St.show();
                break;
            case 4:
                St.show();
                break;
            case 5:
                cout << "���������� ������.";
                run = false;
                exit(0);
            default: cout << "������������ ��������. ���������� ��� ���." << '\n';
        }
    }
}
