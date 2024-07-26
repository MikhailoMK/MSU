#include <iostream>
#include <windows.h>
using namespace std;

template <typename I, typename V>

class Ring
{
private:
    struct List
    {
        I Index;
        V val;
        List *PointerToPrevious;
        List *PointerToNext;
    };
    List *PointerToLast;
    int N;

public:
    Ring() : PointerToLast(nullptr), N(0) {}

    bool if_index(int index)
    {
        bool test = false;
        if (PointerToLast == nullptr)
            test = false;
        else
        {
            List *node = new List;
            node = PointerToLast;
            for (int i = 0; i < N; i++){
                if (node->Index == index)
                    test = true;
                node = node->PointerToPrevious;
            }
        }
        if (test)
            cout << "Индекс: " << index << " уже занят.\n";
        return test;
    }

    void add_ring(I index, V value)
    {
        while (if_index(index)){
            cout << "Введите индекс ещё раз: ";
            cin >> index;
        }
        List *NewRecord = new List;
        NewRecord->Index = index;
        NewRecord->val = value;
        if (PointerToLast == nullptr){
            NewRecord->PointerToPrevious = NewRecord;
            NewRecord->PointerToNext = NewRecord;
            PointerToLast = NewRecord;
        }
        List *temp = PointerToLast;
        for(int i = 0; i < N - 1; i++){
            temp = temp->PointerToPrevious;
        }
        NewRecord->PointerToNext = temp;
        temp->PointerToPrevious = NewRecord;
        NewRecord->PointerToPrevious = PointerToLast;
        if(PointerToLast != nullptr){
            NewRecord->PointerToPrevious = PointerToLast;
            PointerToLast->PointerToNext = NewRecord;
            PointerToLast = NewRecord;
        }
        N++;
    }

    void delete_list(int index)
    {
        if(PointerToLast == nullptr){
             cout << "Список пуст.\n";
            return;
        }
        List *temp = PointerToLast;
        for(int i = 0; i < N; i++){
            if(temp->Index == index){
                temp->PointerToPrevious->PointerToNext = temp->PointerToNext;
                temp->PointerToNext->PointerToPrevious = temp->PointerToPrevious;
                if(temp == PointerToLast){
                    PointerToLast = temp->PointerToPrevious;
                }
                delete temp; N -= 1;
                return;
            }
            temp = temp->PointerToPrevious;
        }
    }

    void alter_index(I index, I new_index)
    {
        List *temp = PointerToLast;
        for(int i = 0; i < N; i++){
            if(temp->Index == index)
                temp->Index = new_index;
            temp = temp->PointerToPrevious;
        }
    }

    void erase_ring()
    {
        PointerToLast = nullptr; N = 0;
    }

    int count()
    {
         cout << "Количество записей: " << N << '\n';
        return N;
    }

    void set_item(I index, V value)
    {
        List *temp = PointerToLast;
        for(int i = 0; i < N; i++){
            if(temp->Index == index){
                temp->val = value;
            }
            temp = temp->PointerToPrevious;
        }
    }

    V get_item(I index)
    {
        List *temp = PointerToLast;
        for(int i = 0; i < N; i++){
            if(temp->Index == index){
                return temp->val;
            }
            temp = temp->PointerToPrevious;
        }
         cout << "Индекс не найден.\n";
    }

    V& operator[](I index)
    {
        List *temp = PointerToLast;
        for(int i = 0; i < N; i++){
            if(temp->Index == index){
                return temp->val;
            }
            temp = temp->PointerToPrevious;
        }
         cout << "Индекс не найден.\n";
    }

    void sort_ring()
    {
        cout << "Выберите метод сортировки: 1 - По возрастанию | 2 - По убыванию: ";
        int choice;
        cin >> choice;
        cout << endl;
        switch (choice)
        {
        case 1:
            for(int i = 0; i < N; i++)
            {
                List *temp = PointerToLast;
                for(int j = 0; j < N - 1; j++)
                {
                    if(temp->val < temp->PointerToPrevious->val)
                    {
                    I temp_index = temp->Index;
                    V temp_value = temp->val;

                    temp->Index = temp->PointerToPrevious->Index;
                    temp->val = temp->PointerToPrevious->val;

                    temp->PointerToPrevious->Index = temp_index;
                    temp->PointerToPrevious->val = temp_value;
                    }
                    temp = temp->PointerToPrevious;
                }
            }
            break;
        case 2:
            for(int i = 0; i < N; i++){
                List *temp = PointerToLast;
                for(int j = 0; j < N - 1; j++){
                    if(temp->val > temp->PointerToPrevious->val){
                    I temp_index = temp->Index;
                    V temp_value = temp->val;

                    temp->Index = temp->PointerToPrevious->Index;
                    temp->val = temp->PointerToPrevious->val;

                    temp->PointerToPrevious->Index = temp_index;
                    temp->PointerToPrevious->val = temp_value;
                    }

                    temp = temp->PointerToPrevious;
                }
            }
            break;
        default:  cout << "Недопустимый параметр. Попробуйте ещё раз." << endl;
        }
        Output();
    }

    void Output()
    {
        List *temp = PointerToLast->PointerToNext;
        for (int i = 0; i < N; i++){
            if (temp->Index >= 10){
                cout << temp->Index << "     " << temp->val << '\n';
            }
            else {
                cout << temp->Index << "      " << temp->val << '\n';
            }
            temp = temp->PointerToNext;
        }
    }
};

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Ring<int, double> Ring;
    Ring.add_ring(1, 2.4);
    Ring.add_ring(2, 3.01);
    Ring.add_ring(5, 2.8);
    Ring.Output();
    bool running = true;
    int operation = 0;
    while(running)
    {
        cout << "----------------------------------------\n"
        << "1. Добавить значение\n"
        << "2. Вывести кольцо\n"
        << "3. Удалить элемент по индексу\n"
        << "4. Изменить индекс\n"
        << "5. Очистить кольцо\n"
        << "6. Вывести колитчество записей\n"
        << "7. Изменить значение по индексу\n"
        << "8. Получить значение по индексу\n"
        << "9. Сортировать кольцо\n"
        << "10. Выйти из программы\n"
        << "----------------------------------------\n"
        << "Выберите операцию: ";
        cin >> operation;
        switch (operation)
        {
            case 1:
            {
                cout << "Введите индекс и значение для добавления: ";
                int index;
                cin >> index;
                double val;
                cin >> val;
                Ring.add_ring(index, val);
                Ring.Output();
                break;
            }
            case 2:
            {
                Ring.Output();
                break;
            }
            case 3:
            {
                cout << "Введите индекс для удаления: ";
                int index;
                cin >> index;
                Ring.delete_list(index);
                Ring.Output();
                break;
            }
            case 4:
            {
                cout << "Введите индекс для изменения: ";
                int index, new_index;
                cin >> index >> new_index;
                Ring.alter_index(index, new_index);
                Ring.Output();
                break;
            }
            case 5:
            {
                Ring.erase_ring();
                break;
            }
            case 6:
            {
                Ring.count();
                break;
            }
            case 7:
            {
                cout << "Введите индекс и значение для изменения: ";
                int index;
                cin >> index;
                double value;
                cin >> value;
                Ring.set_item(index, value);
                break;
            }
            case 8:
            {
                cout << "Введите индекс для получения значения: ";
                int index;
                cin >> index;
                double ans = Ring.get_item(index);
                cout << ans << '\n';
                break;
            }
            case 9:
            {
                Ring.sort_ring();
                break;
            }
            case 10:
            {
                cout << "Завершение работы.";
                running = false;
                exit(0);
            }
            default: cout << "Недопустимый параметр. Попробуйте ещё раз." << endl;
        }
    }
    return 0;
}
