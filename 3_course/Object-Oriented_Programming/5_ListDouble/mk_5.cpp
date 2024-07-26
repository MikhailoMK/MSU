#include <iostream>
#include <windows.h>
using namespace std;

template <typename T>
class DoublyList
{
private:
    struct List
    {
        int Index;
        T val;
        List *PointerToNext;
        List *PointerToPrevious;
    };
    List *PointerToLast;

public:
    DoublyList() : PointerToLast(nullptr) {}

    int count()
    {
        int ans = 0;
        List *current = new List;
        current = PointerToLast;
        while (current != nullptr){
            ans++;
            current = current->PointerToPrevious;
        }
        return ans;
    }

    bool if_index(int index){
        bool test = false;
        if (PointerToLast == nullptr)
            test = false;
        else
        {
            List *node = new List;
            node = PointerToLast;
            while (node != nullptr){
                if (node->Index == index) test = true;
                node = node->PointerToPrevious;
            }
        }

        if(test) cout << "������: " << index << " ��� �����.\n";

        return test;
    }

    T& operator[](int index)
    {
        List* Current = new List;
        Current = PointerToLast;

        for(int i = 0; i < count(); i++){
            if(Current->Index == index) return Current->val;
            Current = Current->PointerToPrevious;
        }
        cout << "������ �� ������";
    }

    void add_end(int index, T value)
    {
        while(if_index(index)){
            cout << "������� ������ ��� ���: ";
            cin >> index;
        }

        List *NewRecord = new List;

        NewRecord->Index = index;
        NewRecord->val = value;
        NewRecord->PointerToNext = nullptr;

        if (PointerToLast == nullptr){
            NewRecord->PointerToPrevious = nullptr;
            PointerToLast = NewRecord;
        }
        else
        {
            NewRecord->PointerToPrevious = PointerToLast;
            PointerToLast->PointerToNext = NewRecord;
            PointerToLast = NewRecord;
        }
        while(PointerToLast->PointerToNext != nullptr){
            PointerToLast = PointerToLast->PointerToNext;
        }
    }

    void add_begin(int index, T value)
    {
        while(if_index(index)){
            cout << "������� ������ ��� ���: ";
            cin >> index;
        }
        List *NewRecord = new List;
        NewRecord->Index = index;
        NewRecord->PointerToPrevious = nullptr;
        NewRecord->val = value;

        if (PointerToLast == nullptr){
            NewRecord->PointerToNext = nullptr;
            PointerToLast = NewRecord;
        }
        else
        {
            List *temp = new List;
            temp = PointerToLast;
            while (temp->PointerToPrevious != nullptr){
                temp = temp->PointerToPrevious;
            }
            NewRecord->PointerToNext = temp;
            temp->PointerToPrevious = NewRecord;
        }
        while(PointerToLast->PointerToNext != nullptr){
            PointerToLast = PointerToLast->PointerToNext;
        }
    }

    void insert_list(int index, T value)
    {
        while(if_index(index)){
            cout << "������� ������ ��� ���: ";
            cin >> index;
        }
        List* NewRecord = new List;
        NewRecord->Index = index;
        NewRecord->val = value;
        NewRecord->PointerToNext = nullptr;
        NewRecord->PointerToPrevious = nullptr;

        if (PointerToLast == nullptr)
        {
            PointerToLast = NewRecord;
        }
        else
        {
            List* temp = PointerToLast;
            List* closest = nullptr;
            int minDiff = INT_MAX;

            while (temp != nullptr){
                int diff = abs(temp->Index - index);
                if (diff < minDiff){
                    minDiff = diff;
                    closest = temp;
                }
                temp = temp->PointerToPrevious;
            }

            if (closest->Index < index){
                NewRecord->PointerToNext = closest->PointerToNext;
                NewRecord->PointerToPrevious = closest;
                if (closest->PointerToNext != nullptr){
                    closest->PointerToNext->PointerToPrevious = NewRecord;
                }
                closest->PointerToNext = NewRecord;
            }
            else
            {
                NewRecord->PointerToNext = closest;
                NewRecord->PointerToPrevious = closest->PointerToPrevious;
                if (closest->PointerToPrevious != nullptr){
                    closest->PointerToPrevious->PointerToNext = NewRecord;
                }
                closest->PointerToPrevious = NewRecord;
            }
        }
        while(PointerToLast->PointerToNext != nullptr){
            PointerToLast = PointerToLast->PointerToNext;
        }
    }

    void delete_list(int index)
    {
        if (PointerToLast == nullptr){
            cout << "������ ����.\n";
            return;
        }

        List* temp = PointerToLast;

        while (temp != nullptr){
            if (temp->Index == index){
                if (temp->PointerToPrevious != nullptr){
                    temp->PointerToPrevious->PointerToNext = temp->PointerToNext;
                }
                if (temp->PointerToNext != nullptr){
                    temp->PointerToNext->PointerToPrevious = temp->PointerToPrevious;
                }
                if (temp == PointerToLast){
                    PointerToLast = temp->PointerToPrevious;
                }
                delete temp;
                return;
            }
            temp = temp->PointerToPrevious;
        }
    }

    void Forward()
    {
        if (PointerToLast == nullptr){
            cout << "\n������ ����\n";
            return;
        }
        List *temp = new List;
        temp = PointerToLast;

        while (temp->PointerToPrevious != nullptr){
            temp = temp->PointerToPrevious;
        }
        while (temp != nullptr){
            if (temp->Index >= 10){
                cout << temp->Index << "     " << temp->val << '\n';
            }
            else {
                cout << temp->Index << "      " << temp->val << '\n';
            }
            temp = temp->PointerToNext;
        }
    }

    void Backward()
    {
        if (PointerToLast == nullptr){
            cout << "\n������ ����\n";
            return;
        }
        List *temp = new List;
        temp = PointerToLast;
        while(temp != nullptr){
            if (temp->Index >= 10){
                cout << temp->Index << "     " << temp->val << '\n';
            }
            else {
                cout << temp->Index << "      " << temp->val << '\n';
            }
            temp = temp->PointerToPrevious;
        }
    }

    void refresh_indexes(int index, int pace)
    {
        List *temp = PointerToLast;
        while(temp->PointerToPrevious != nullptr){
            temp = temp->PointerToPrevious;
        }
        while(temp->PointerToNext != nullptr){
            temp->Index = index;
            index += pace;
            temp = temp->PointerToNext;
        }
        PointerToLast->Index = index;
    }

    void erase_all()
    {
        PointerToLast = nullptr;
        cout << "������ �����.\n";
    }

    void sort_list()
    {
        cout << "�������� ����� ����������: 1 - �� ����������� | 2 - �� ��������: ";
        int choice;
        cin >> choice;
        switch (choice)
        {
        case 1:
            for(int i = 0; i < count(); i++){
                List *temp = PointerToLast;
                while(temp->PointerToPrevious != nullptr){
                    if(temp->val < temp->PointerToPrevious->val){
                        int temp_index = temp->Index, temp_pre_index = temp->PointerToPrevious->Index;
                        T temp_value = temp->val, temp_pre_val = temp->PointerToPrevious->val;

                        temp->Index = temp_pre_index;
                        temp->val = temp_pre_val;
                        temp->PointerToPrevious->Index = temp_index;
                        temp->PointerToPrevious->val = temp_value;
                    }
                    temp = temp->PointerToPrevious;
                }
            }
            break;
        case 2:
            for(int i = 0; i < count(); i++){
                List *temp = PointerToLast;
                while(temp->PointerToPrevious != nullptr){
                    if(temp->val > temp->PointerToPrevious->val){
                        int temp_index = temp->Index, temp_pre_index = temp->PointerToPrevious->Index;
                        T temp_value = temp->val, temp_pre_val = temp->PointerToPrevious->val;

                        temp->Index = temp_pre_index;
                        temp->val = temp_pre_val;
                        temp->PointerToPrevious->Index = temp_index;
                        temp->PointerToPrevious->val = temp_value;
                    }
                    temp = temp->PointerToPrevious;
                }
            }
            break;
        default: cout << "������������ ��������. ���������� ��� ���." << endl;
        }
        Forward();
    }
};

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    DoublyList<int> List;
    List.add_end(7, 7);
    List.add_end(2, 4);
    List.add_end(9, 6);
    List.add_begin(8, 5);
    List.insert_list(1, 9);
    List.insert_list(10, 3);
    List.Forward();
    bool running = true;
    int operation = 0;
    while(running)
    {
        cout << "----------------------------------------\n"
        << "1. �������� �������� � �����.\n"
        << "2. �������� �������� � ������.\n"
        << "3. �������� �������� � ������.\n"
        << "4. ������� �������� �� �������.\n"
        << "5. ������� ���������������.\n"
        << "6. ������� � �������� �������.\n"
        << "7. �������� �������.\n"
        << "8. ������� ����������� �������.\n"
        << "9. �������� ������.\n"
        << "10. ����������� ������.\n"
        << "11. ����� �� ���������.\n"
        << "----------------------------------------\n"
        << "�������� ��������: ";
        cin >> operation;
        switch (operation)
        {
            case 1:
            {
                cout << "������� ������ � �������� ��� ����������: ";
                int index, val;
                cin >> index >> val;
                List.add_end(index, val);
                List.Forward();
                break;
            }
            case 2:
            {
                cout << "������� ������ � �������� ��� ����������: ";
                int index, val;
                cin >> index >> val;
                List.add_begin(index, val);
                List.Forward();
                break;
            }
            case 3:
            {
                cout << "������� ������ � �������� ��� ����������: ";
                int index, val;
                cin >> index >> val;
                List.insert_list(index, val);
                List.Forward();
                break;
            }
            case 4:
            {
                cout << "������� ������ ��� ��������: ";
                int index;
                cin >> index;
                List.delete_list(index);
                List.Forward();
                break;
            }
            case 5:
            {
                List.Forward();
                break;
            }
            case 6:
            {
                List.Backward();
                break;
            }
            case 7:
            {
                cout << "������� ������ ������ � ���: ";
                int index, pace;
                cin >> index >> pace;
                List.refresh_indexes(index, pace);
                break;
            }
            case 8:
            {
                int ans = List.count();
                cout << "���������� �������: " << ans << '\n';
                break;
            }
            case 9:
            {
                List.erase_all();
                break;
            }
            case 10:
            {
                List.sort_list();
                break;
            }
            case 11:
            {
                cout << "���������� ������.";
                running = false;
                exit(0);
            }
            default: cout << "������������ ��������. ���������� ��� ���." << endl;
        }
    }
    return 0;
}
