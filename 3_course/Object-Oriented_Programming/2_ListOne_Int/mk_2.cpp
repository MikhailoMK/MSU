#include <bits/stdc++.h>
#include <iostream>
#include <string>
#include <fstream>
#include <windows.h>
using namespace std;

template <typename T>
class ListOne_Int
{
    struct List
    {
        int Index;
        T val;
        List *PointerToNext;
    };
private:
    List *PointerToFirst; int QuantityOfLists;
public:

    ListOne_Int() : PointerToFirst(nullptr), QuantityOfLists(0) {}

    void AddList(T val)
    {
        List* newrec = new List;
        newrec->val = val;
        newrec->Index = 0;
        newrec->PointerToNext = nullptr;

        if(QuantityOfLists == 0){
            PointerToFirst = newrec;
        }
        else {
            List* Current = new List;
            Current = PointerToFirst;
            Current->Index = 0;

            List* Previous = new List;
            Previous = nullptr;

            int index = 1;

            while(Current != nullptr){
                Previous = Current;
                newrec->Index = index++;
                Current = Current->PointerToNext;
            }
            Previous->PointerToNext = newrec;

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
        List* Current = new List;
        Current = PointerToFirst;

        int index = 0;

        while(Current != nullptr){
            Current->Index = index++;
            Current = Current->PointerToNext;
        }
    }

    void SortList()
    {
        for(int i = 1; i < QuantityOfLists; i++){
            T key = (*this)[i];
            int left = 0;
            int right = i;

            while(left < right){
                int mid = left + (right - left) / 2;
                if(key < (*this)[mid]){
                    right = mid;
                }
                else {
                    left = mid + 1;
                }
            }
            for(int j = i; j > left; j--){
                (*this)[j] = (*this)[j - 1];
            }
            (*this)[left] = key;
        }
        Output();
    }

    void SortListDesc()
    {
        for(int i = 1; i < QuantityOfLists; i++){
            T key = (*this)[i];
            int left = 0;
            int right = i;

            while(left < right){
                int mid = left + (right - left) / 2;
                if(key > (*this)[mid]){
                    right = mid;
                }
                else {
                    left = mid + 1;
                }
            }
            for(int j = i; j > left; j--){
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
        cout << "Список удалён\n";
        Output();
    }

    int CountOfLists()
    {
        return QuantityOfLists;
    }

    string ListToString()
    {
        string result = "";

        List* current = new List;
        current = PointerToFirst;
        while(current != nullptr){
            result += std::to_string(current->val) + " ";
            current = current->PointerToNext;
        }
        cout << result << '\n';
        return result;
    }

    void SaveToFile(string FileName)
    {
        ofstream file(FileName);

        for(int i = 0; i < QuantityOfLists; i++){
            file << (*this)[i] << ' ';
        }
        this->Output();
        cout << "Файл был сохранён в '"+FileName+"'" << endl;
    }

    void LoadFromFile(string FileName)
    {
        this->EraseList();
        ifstream file(FileName);
        T temp; int i = 0;
        while(file >> temp){
            this->AddList(temp);
        }

        this->Output();
        cout << "Список был загружен из '"+FileName+"'" << endl;
    }

    T& operator[](int Index)
    {
        if(Index >= QuantityOfLists) cout << "Индекс вне диапазона\n";

        List* Current = new List;
        Current = PointerToFirst;

        for(int i = 0; i < Index; i++){
            Current = Current->PointerToNext;
        }

        return Current->val;
    }

    void OutputByIndex(int index)
    {
        List* current = new List;
        current = PointerToFirst;

        for(int i = 0; i < index; i++){
            current = current->PointerToNext;
        }
        cout << current->Index + 1 << ". " << current->val << '\n';
    }

    void Output()
    {
        cout << "----------------------------------------\n";

        List* current = new List;
        current = PointerToFirst;

        for(int i = 0; i < QuantityOfLists; i++){
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
    ListOne_Int<int> List;
    for(int i = 1; i < 100; i += 7) List.AddList(i);
    bool running = true;
    int oper = 0;
    while(running){
        cout << "1. Добавить значение в список\n"
        << "2. Удалить значение по индексу\n"
        << "3. Стереть весь список\n"
        << "4. Сортировать список\n"
        << "5. Получить количество записей в списке\n"
        << "6. Инвертировать список к типу String\n"
        << "7. Сохранить список в файл\n"
        << "8. Загрузить из файла\n"
        << "9. Вывести спискок\n"
        << "10. Вывести по индексу\n"
        << "11. Обновить индекс\n"
        << "12. Выйти из программы\n"
        << "----------------------------------------\n"
        << "Выберите операцию: ";
        cin >> oper;

        switch (oper){
            case 1:
            {
                cout << "Выберите значение для добавления: ";
                int val;
                cin >> val;
                List.AddList(val);
                List.Output();
                break;
            }
            case 2:
            {
                List.Output();
                cout << "Выберите индекс для удаления: ";
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
                cout << "Выберите метод сортировки: 1 - По возрастанию | 2 - По убыванию: ";
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
                default: break;
                }
                break;
            }
            case 5:
            {
                cout << "----------------------------------------\n";
                cout << "Количество записей: " << List.CountOfLists() << '\n';
                break;
            }
            case 6:
            {
                cout << "Название строки: ";
                string result;
                cin >> result;

                result = List.ListToString();
                break;
            }
            case 7:
            {
                cout << "Файл для сохрания: ";
                string FileName;
                cin >> FileName;

                FileName += ".txt";
                List.SaveToFile(FileName);
                break;
            }
            case 8:
            {
                cout << "Файл для загрузки: ";
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
                cout << "Введите индекс: ";
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
                cout << "Завершение работы";
                running = false;
                exit(0);
            }
            default: cout << "Недопустимый параметр. Попробуйте ещё раз." << endl;
        }
    }
    return 0;
}
