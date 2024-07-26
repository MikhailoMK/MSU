#include <iostream>
#include <bits/stdc++.h>
#include <windows.h>

using namespace std;

class Rec{
public:
    int factorial(int n){
        if (n == 1 || n == 0) return 1;
        else return n * factorial(n - 1);
    }

    string triangle(int n){
        if (n == 1) return "o";
        else return "o " + triangle(n - 1);
    }

    int fib(int n){
        if (n == 0) return 0;
        else if (n == 1) return 1;
        else return fib(n - 1) + fib(n - 2);
    }

    int NOD(int a, int b){
        if (b == 0) return a;
        else return NOD(b, a % b);
    }

    int summa(int n){
        if (n / 10 == 0) return n % 10;
        else return n % 10 + summa(n / 10);
    }

    int kol_vo(int n){
        if (n == 0) return 0;
        else return 1 + kol_vo(n / 10);
    }

    int NToK(int n, int k){
        if (n / k == 0) return n % k;
        else return NToK(n / k, k) * 10 + n % k;
    }

    int rot(int n){
        if (n / 10 == 0) return n % 10;
        else return n % 10 * pow(10, kol_vo(n / 10)) + rot(n / 10);
    }

    int maxe(int *a, int n)
    {
        if(n == 1)
            return a[0];
        while(n > 0)
            return (a[n - 1] > maxe(a, n - 1)) ? a[n - 1] : maxe(a, n - 1);
    }

    double root(double x, int k, int n)
    {
        if(n == 0)
            return 1;
        return root(x, k, n - 1) - (root(x, k, n - 1) - x / pow(root(x, k, n - 1), k - 1)) / k;
    }

    void tower(int n, char A, char B, char C, int &g)
    {
        g++;
        if (n == 1)
        {
            cout << A << " -> " << C << endl;
        }
        else
        {
            tower(n - 1, A, C, B, g);
            cout << A << " -> " << C << endl;
            tower(n - 1, B, A, C, g);
        }
    }
};


int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);

    Rec rec;
    string s = "";

    bool running = true;
    int operation = 0;
    while(running)
    {
        cout << "----------------------------------------\n"
        << "1. Факториал\n"
        << "2. Треугольник\n"
        << "3. Фибоначчи\n"
        << "4. НОД\n"
        << "5. Сумма цифр\n"
        << "6. Количество цифр\n"
        << "7. Система счисления\n"
        << "8. Перевернуть цифры числа\n"
        << "9. Найти максимальный элемент\n"
        << "10. Вычислить корень\n"
        << "11. Ханойская башня\n"
        << "12. Выйти из программы\n"
        << "----------------------------------------\n"
        << "Выберите операцию: ";
        cin >> operation;
        switch (operation)
        {
            case 1:
            {
                cout << "Введите число: ";
                int n;
                cin >> n;
                cout << rec.factorial(n) << endl;
                break;
            }
            case 2:
            {
                cout << "Введите высоту треугольника: ";
                int n;
                cin >> n;
                for(int i = 0; i < n; i++) s += " ";
                for(int i = 1; i <= n; i++){
                    s.erase(0, 1);
                    cout << (s + rec.triangle(i)) << endl;
                }
                break;
            }
            case 3:
            {
                cout << "Введите число: ";
                int n;
                cin >> n;
                for (int i = 1; i <= n; i++)
                    cout << rec.fib(i) << " ";
                cout << endl;
                break;
            }
            case 4:
            {
                cout << "Введите числа: ";
                int a, b;
                cin >> a >> b;
                cout << rec.NOD(a, b) << endl;
                break;
            }
            case 5:
            {
                cout << "Введите число: ";
                int n;
                cin >> n;
                cout << rec.summa(n) << endl;
                break;
            }
            case 6:
            {
                cout << "Введите число: ";
                int n;
                cin >> n;
                cout << rec.kol_vo(n) << endl;
                break;
            }
            case 7:
            {
                cout << "Введите число и систему счисления: ";
                int n, k;
                cin >> n >> k;
                cout << rec.NToK(n, k) << endl;
                break;
            }
            case 8:
            {
                cout << "Введите число: ";
                int n;
                cin >> n;
                cout << rec.rot(n) << endl;
                break;
            }
            case 9:
            {
                int n;
                cout << "Введите количесто элементов в массиве: ";
                cin >> n;
                int arr[n];
                cout << "Заполните массив: ";
                for(int i = 0; i < n; i++)
                    cin >> arr[i];
                cout << rec.maxe(arr, n) << endl;
                break;
            }
            case 10:
            {
                double x;
                int k, n;
                cout << "Введите числа X, K и N: ";
                cin >> x >> k >> n;
                cout << rec.root(x, k, n) << endl;
                break;
            }
            case 11:
            {
                char from, to, aux;
                int n, g = 0;
                cout << "Введите уровень <<Ханойской башни>>: ";
                cin >> n;
                rec.tower(n, 'A', 'B', 'C', g);
                cout << g << endl;
                break;
            }
            case 12:
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
