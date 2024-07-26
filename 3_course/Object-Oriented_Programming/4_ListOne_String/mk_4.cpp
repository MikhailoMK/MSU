#include <bits/stdc++.h>
#include <iostream>
#include <string>
#include <fstream>
#include <limits>
#include <windows.h>
using namespace std;

template <typename T>
class ListOneWay
{
    struct List
    {
        int Index;
        T val;
        List *PointerToNext;
    };

private:
    List *PointerToFirst;
    int QuantityOfLists;

public:
    ListOneWay() : PointerToFirst(nullptr), QuantityOfLists(0) {}

    void AddList(T val)
    {
        List *NewRecord = new List;
        NewRecord->val = val;
        NewRecord->Index = 0;
        NewRecord->PointerToNext = nullptr;

        if (QuantityOfLists == 0)
        {
            PointerToFirst = NewRecord;
        }
        else
        {
            List *Current = new List;
            Current = PointerToFirst;
            Current->Index = 0;
            List *Previous = new List;
            Previous = nullptr;

            int index = 1;

            while (Current != nullptr)
            {
                Previous = Current;
                NewRecord->Index = Current->Index + 1;
                Current = Current->PointerToNext;
            }
            Previous->PointerToNext = NewRecord;
        }
        QuantityOfLists++;
    }

    void DeleteList(int index)
    {
        List* current = new List;
        current = PointerToFirst;

        List* previous = new List;
        previous = nullptr;

        if (current->Index == index){
            PointerToFirst = current->PointerToNext;
        }
        else
        {
            while (current->PointerToNext->Index != index){
                current = current->PointerToNext;
            }

            if (!current) return;

            previous = current;
            current = current->PointerToNext;

            if (previous != nullptr){
                previous->PointerToNext = current->PointerToNext;
            }
            else {
                PointerToFirst = current->PointerToNext;
            }
        }

        delete current;
        QuantityOfLists--;
        Output();
    }

    void RefreshIndexes()
    {
        List *Current = new List;
        Current = PointerToFirst;

        int index = 0;

        while (Current != nullptr)
        {
            Current->Index = index++;
            Current = Current->PointerToNext;
        }
    }

    void SortList()
    {
        for (int i = 1; i < QuantityOfLists; i++)
        {
            T key = (*this)[i];
            int left = 0;
            int right = i;

            while (left < right)
            {
                int mid = left + (right - left) / 2;
                if (key < (*this)[mid])
                {
                    right = mid;
                }
                else
                {
                    left = mid + 1;
                }
            }
            for (int j = i; j > left; j--)
            {
                (*this)[j] = (*this)[j - 1];
            }
            (*this)[left] = key;
        }
        Output();
    }

    void SortListDesc()
    {
        for (int i = 1; i < QuantityOfLists; i++)
        {
            T key = (*this)[i];
            int left = 0;
            int right = i;

            while (left < right)
            {
                int mid = left + (right - left) / 2;
                if (key > (*this)[mid])
                {
                    right = mid;
                }
                else
                {
                    left = mid + 1;
                }
            }
            for (int j = i; j > left; j--)
            {
                (*this)[j] = (*this)[j - 1];
            }
            (*this)[left] = key;
        }
        Output();
    }

    void EraseList()
    {
        PointerToFirst = nullptr;
        QuantityOfLists = 0;
        cout << "������ �����.\n";
        Output();
    }

    int CountOfLists()
    {
        return QuantityOfLists;
    }

    string ListToString()
    {
        string result = "";

        List *current = new List;
        current = PointerToFirst;
        while (current != nullptr)
        {
            result += (current->val) + "\n";
            current = current->PointerToNext;
        }
        cout << result << '\n';
        return result;
    }

    void SaveToFile(string FileName)
    {
        ofstream file(FileName);

        for (int i = 0; i < QuantityOfLists; i++)
        {
            file << (*this)[i] << '\n';
        }
        this->Output();
        cout << "���� ������� � '" + FileName + "'" << endl;
    }

    void LoadFromFile(string FileName)
    {
        this->EraseList();
        ifstream file(FileName);
        T temp;
        int i = 0;
        while (getline(file, temp))
        {
            this->AddList(temp);
        }
        this->Output();
        cout << "������ ��� �������� �� '" + FileName + "'" << endl;
    }

    T &operator[](int Index)
    {
        if (Index >= QuantityOfLists) cout << "������ ��� ���������\n";

        List *Current = new List;
        Current = PointerToFirst;

        for (int i = 0; i < Index; i++)
        {
            Current = Current->PointerToNext;
        }

        return Current->val;
    }

    void OutputByIndex(int index)
    {
        List *current = new List;
        current = PointerToFirst;
        for (int i = 0; i < index; i++)
        {
            if (current->Index == index)
                break;
            current = current->PointerToNext;
        }
        cout << current->Index + 1 << ". " << current->val << '\n';
    }

    void Output()
    {
        cout << "----------------------------------------\n";

        List *current = new List;
        current = PointerToFirst;

        for (int i = 0; i < QuantityOfLists; i++)
        {
            cout << current->Index + 1 << ". " << current->val << '\n';
            current = current->PointerToNext;
        }

        cout << endl;
    }
};

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    ListOneWay<string> List;
    List.AddList("����");
    bool running = true;
    int operation = 0;
    while (running)
    {
        cout << "1. �������� �������� � ������\n"
        << "2. ������� �������� �� �������\n"
        << "3. ������� ���� ������\n"
        << "4. ����������� ������\n"
        << "5. �������� ���������� ������� � ������\n"
        << "6. ������������� ������ � ���� String\n"
        << "7. ��������� ������ � ����\n"
        << "8. ��������� �� �����\n"
        << "9. ������� �������\n"
        << "10. ������� �� �������\n"
        << "11. �������� ������\n"
        << "12. ������� ���������\n"
        << "----------------------------------------\n"
        << "�������� ��������: ";
        cin >> operation;

        switch (operation)
        {
        case 1:
        {
            std::cin.ignore(numeric_limits<streamsize>::max(), '\n');
            cout << "�������� �������� ��� ����������: ";
            string val;
            getline(cin, val);
            List.AddList(val);
            List.Output();
            break;
        }
        case 2:
        {
            List.Output();
            cout << "�������� ������ ��� ��������: ";
            int index;
            cin >> index;
            List.DeleteList(index - 1);
            break;
        }
        case 3:
        {
            List.EraseList();
            break;
        }
        case 4:
        {
            cout << "�������� ����� ����������: 1 - �� ����������� | 2 - �� ��������: ";
            int choose;
            cin >> choose;
            switch (choose)
            {
            case 1:
            {
                List.SortList();
                break;
            }
            case 2:
            {
                List.SortListDesc();
                break;
            }
            default:
                break;
            }
            break;
        }
        case 5:
        {
            cout << "----------------------------------------\n";
            cout << "���������� �������: " << List.CountOfLists() << '\n' << endl;
            break;
        }
        case 6:
        {
            string result;
            result = List.ListToString();
            break;
        }
        case 7:
        {
            cout << "�������� �����: ";
            string FileName;
            cin >> FileName;
            FileName += ".txt";
            List.SaveToFile(FileName);
            break;
        }
        case 8:
        {
            cout << "���� ��� ��������: ";
            string FileName;
            cin >> FileName;
            List.LoadFromFile(FileName);
            break;
        }
        case 9:
        {
            List.Output();
            break;
        }
        case 10:
        {
            cout << "������� ������: ";
            int IndexToOutput;
            cin >> IndexToOutput;
            List.OutputByIndex(IndexToOutput - 1);
            break;
        }
        case 11:
        {
            List.RefreshIndexes();
            List.Output();
            break;
        }
        case 12:
        {
            cout << "���������� ������";
            running = false;
            exit(0);
        }
        default:
            cout << "������������ ��������. ���������� ��� ���." << endl;
        }
    }
    return 0;
}
