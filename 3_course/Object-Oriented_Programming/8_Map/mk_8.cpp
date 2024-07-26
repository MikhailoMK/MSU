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
        cout << "���� �� ������. ����� ���������� �������� �� ���������. ����������, ������� ���� ��� ���.\n";
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
        cout << "���� �� ��� ������. ����� ��������� ���� �� ���������. ����������, ������� �������� ��� ���.\n";
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
                    cout <<"������ �� ������.\n";
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
        cout << "�������� ����� ����������: 1 - �� ����������� | 2 - �� ��������: ";
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
        cout << "����� ���� �� ������.\n";
        return default_value;
    }
    void show()
    {
        begin();
        for(int i = 0; i < size; i++){
            cout << "������: " << current->index << " | ����: " << current->key << " | ��������: " << current->val << endl;
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
    Map<int,string> map(0, "����");
    map.insert(1, "������");
    map.insert(2, "�������");
    map.insert(3, "����������");

    bool run = true;
    int operation = 0;
    while(run){
        cout << "----------------------------------------\n"
        << "1. ������� ���������� ���������\n"
        << "2. ����� ������� �� �����\n"
        << "3. ����� ������� �� ��������\n"
        << "4. �������� �������\n"
        << "5. �������� �������\n"
        << "6. ������� ������� �� �������\n"
        << "7. ����������� map\n"
        << "8. ��������� � ����\n"
        << "9. ������� map\n"
        << "10. ����� �� ���������\n"
        << "----------------------------------------\n"
        << "�������� ��������: ";
        cin >> operation;

        switch (operation)
        {
            case 1:
            {
                int quan = map.count();
                cout <<"����������: " << quan << '\n';
                break;
            }
            case 2:
            {
                int key;
                string val;
                cout << "������� ���� ��� ������: ";
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
                cout << "������� �������� ��� ������: ";
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
                cout << "������� ���� ��� ����������: ";
                cin >> k;
                cout << "������� �������� ��� ����������: ";
                cin.ignore();
                getline(cin, v);
                if(map.if_key_is_present(k))
                {
                    cout << "���� ��� ������������, ������� �������� �������� ����� ��������.\n";
                }
                map.insert(k, v);
                map.show();
                break;
            }
            case 6:
            {
                int index_to_delete;
                cout << "������� ������ ��� ��������: ";
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
                cout << "���������� ������.";
                run = false;
                exit(0);
            }
            default: cout << "������������ ��������. ���������� ��� ���." << endl;
        }
    }
    return 0;
}
