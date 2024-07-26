#include <iostream>
#include <fstream>
#include <windows.h>
using namespace std;

template <typename K, typename V>

class Map
{
private:
    struct Element
    {
        K key;
        V val;
        int index;
    };
    Element *elements, *current;
    int size, capacity;
    V default_value;
    K default_key;

public:
    Map() : size(0), capacity(10) { elements = new Element[capacity]; }
    ~Map() { delete[] elements; }
    Map(K key, V val)
    {
        elements = new Element[1];
        elements[0] = {key, val};
        size = 1;
        capacity = 1;
        default_value = val;
        default_key = key;
    }
    bool if_key_is_present(K key_if_present)
    {
        for(int i = 0; i < size; i++){
            if(elements[i].key == key_if_present)
            {
                return true;
            }
        }
        return false;
    }
    int count()
    {
        return size;
    }
    V find(K key_to_search_for)
    {
        for(int i = 0; i < size; i++){
            if(elements[i].key == key_to_search_for)
            {
                return elements[i].val;
            }
        }
        cout << "Ключ не найден. Будет возвращено значение по умолчанию. Пожалуйста, введите ключ еще раз.\n";
        return default_value;
    }
    K find(V value_to_search_for)
    {
        for(int i = 0; i < size; i++){
            if(elements[i].val == value_to_search_for)
            {
                return elements[i].key;
            }
        }
        cout << "Ключ не был найден. Будет возвращен ключ по умолчанию. Пожалуйста, введите значение еще раз.\n";
        return default_key;
    }
    void refresh_indexes()
    {
        for(int i = 0; i < size; i++){
            elements[i].index = i;
        }
    }
    void insert(K key_to_insert, V value_to_insert)
    {
        for(int i = 0; i < size; i++){
            if(elements[i].key == key_to_insert)
            {
                elements[i].val = value_to_insert;
                return;
            }
        }
        if(size == capacity)
        {
            capacity *= 2;
            Element *new_elements = new Element[capacity];
            for(int i = 0; i < size; i++){
                new_elements[i] = elements[i];
            }
            delete[] elements;
            elements = new_elements;
        }
        int temp = elements[size - 1].index;
        elements[size++] = {key_to_insert, value_to_insert, temp + 1};
    }
    void delete_element(int index_to_delete)
    {
        bool aha = false;
        if(size >= 0)
        {
            for(int i = 0; i < size; i++){
                if(elements[i].index == index_to_delete && aha == false)
                {
                    index_to_delete = i;
                    aha = true;
                }
            }
            if(aha == false)
                {
                    cout <<"Индекс не найден.\n";
                    return;
                }
            for(int i = index_to_delete; i < size - 1; i++){
                elements[i] = elements[i + 1];
            }
            size--;
        }
    }
    void begin()
    {
        if(size > 0)
        {
            current = &elements[0];
        }
    }
    void end()
    {
        if(size > 0)
        {
            current = &elements[size - 1];
        }
    }
    void sort_map()
    {
        int choice;
        cout << "Выберите метод сортировки: 1 - По возрастанию | 2 - По убыванию: ";
        cin >> choice;
        switch (choice)
        {
        case 1:
            for(int i = 0; i < size - 1; i++){
                for(int j = i + 1; j < size; j++){
                    if(elements[i].val > elements[j].val)
                    {
                        Element temp = elements[i];
                        elements[i] = elements[j];
                        elements[j] = temp;
                    }
                }
            }
            break;
        case 2:
            for(int i = 0; i < size - 1; i++){
                for(int j = i + 1; j < size; j++){
                    if(elements[i].val < elements[j].val)
                    {
                        Element temp = elements[i];
                        elements[i] = elements[j];
                        elements[j] = temp;
                    }
                }
            }
            break;
        default:
            break;
        }
    }
    V& operator[](K search_key)
    {
        for(int i = 0; i < size; i++){
            if(elements[i].key == search_key)
            {
                return elements[i].val;
            }
        }
        cout << "Такой ключ не найден.\n";
        return default_value;
    }
    void show()
    {
        begin();
        for(int i = 0; i < size; i++){
            cout << "Индекс: " << current->index << " | Ключ: " << current->key << " | Значение: " << current->val << endl;
            ++current;
        }
        begin();
    }
    void save_to_file()
    {
        ofstream file("asd.txt");
        for(int i = 0; i < size; i++){
            file << elements[i].index << ' ' << elements[i].key << ' ' << elements[i].val << '\n';
        }
    }
};


int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Map<int,string> map(0, "Тест");
    map.insert(1, "Михаил");
    map.insert(2, "Кузьмин");
    map.insert(3, "Дмитриевич");

    bool run = true;
    int operation = 0;
    while(run){
        cout << "----------------------------------------\n"
        << "1. Вывести количество элементов\n"
        << "2. Найти элемент по ключу\n"
        << "3. Найти элемент по значению\n"
        << "4. Обновить индексы\n"
        << "5. Добавить элемент\n"
        << "6. Удалить элемент по индексу\n"
        << "7. Сортировать map\n"
        << "8. Сохранить в файл\n"
        << "9. Вывести map\n"
        << "10. Выйти из программы\n"
        << "----------------------------------------\n"
        << "Выберите операцию: ";
        cin >> operation;

        switch (operation)
        {
            case 1:
            {
                int quan = map.count();
                cout <<"Количество: " << quan << '\n';
                break;
            }
            case 2:
            {
                int key;
                string val;
                cout << "Введите ключ для поиска: ";
                cin >> key;
                val = map.find(key);
                cout << val << '\n';
                break;
            }
            case 3:
            {
                cin.ignore();
                int key;
                string val;
                cout << "Введите значение для поиска: ";
                getline(cin, val);
                key = map.find(val);
                cout << key << '\n';
                break;
            }
            case 4:
            {
                map.refresh_indexes();
                map.show();
                break;
            }
            case 5:
            {
                int k; string v;
                cout << "Введите ключ для добавления: ";
                cin >> k;
                cout << "Введите значение для добавления: ";
                cin.ignore();
                getline(cin, v);
                if(map.if_key_is_present(k))
                {
                    cout << "Ключ уже используется, поэтому значение элемента будет изменено.\n";
                }
                map.insert(k, v);
                map.show();
                break;
            }
            case 6:
            {
                int index_to_delete;
                cout << "Введите индекс для удаления: ";
                cin >> index_to_delete;
                map.delete_element(index_to_delete);
                map.show();
                break;
            }
            case 7:
            {
                map.sort_map();
                map.show();
                break;
            }
            case 8:
            {
                map.save_to_file();
                break;
            }
            case 9:
            {
                map.show();
                break;
            }
            case 10:
            {
                cout << "Завершение работы.";
                run = false;
                exit(0);
            }
            default: cout << "Недопустимый параметр. Попробуйте ещё раз." << endl;
        }
    }
    return 0;
}
