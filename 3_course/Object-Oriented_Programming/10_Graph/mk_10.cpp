#include <iostream>
#include <limits>
#include <iomanip>
#include <windows.h>
#include <algorithm>
#include <queue>

using namespace std;

constexpr double MAX_DOUBLE = numeric_limits<double>::max();

class Graph
{
public:
    void district_matrix(double *A, int vert, string *districts)
    {
        int i, j;

        cout << setw(12) << ' ';
        for (i = 0; i < vert; i++)
            cout << setw(13) << left << districts[i];
        cout << endl;

        for (i = 0; i < vert; i++){
            cout << setw(12) << left << districts[i];
            for (j = 0; j < vert; j++){
                if (A[i * vert + j] == MAX_DOUBLE)
                    cout << setw(12) << left << setprecision(3) << 'X' << ' ';
                else
                    cout << setw(12) << left << setprecision(3) << A[i * vert + j] << ' ';
            }
            cout << endl;
        }
        cout << endl;
    }
    void city_matrix(double *A, int vert, string *cities)
    {
        int i, j;

        cout << setw(12) << ' ';
        for (i = 0; i < vert; i++)
            cout << setw(13) << left << cities[i];
        cout << endl;

        for (i = 0; i < vert; i++)
        {
            cout << setw(12) << left << cities[i];
            for (j = 0; j < vert; j++)
            {
                if(A[i * vert + j] == MAX_DOUBLE)
                    cout << setw(12) << left << setprecision(3) << 'X' << " ";
                else
                    cout << setw(12) << left << setprecision(3) << A[i * vert + j] << " ";
            }
            cout << endl;
        }
        cout << endl;
    }

    double Dejxtri(double *A, int vert, int from, int to)
    {
        double distances[vert], distance, new_distance;
        bool visited[vert];
        int i, vertex, next;

        for (i = 0; i < vert; i++){
            distances[i] = MAX_DOUBLE;
            visited[i] = false;
        }

        priority_queue<pair<double, int>, vector<pair<double, int>>, greater<pair<double, int>>> queue;
        queue.push({0, from});

        while (!queue.empty()){
            distance = queue.top().first;
            vertex = queue.top().second;
            queue.pop();

            if (visited[vertex])
                continue;

            for (next = 0; next < vert; next++)
            {
                if (!visited[next])
                {
                    new_distance = distance + A[vertex * vert + next];

                    if (new_distance < distances[next])
                    {
                        distances[next] = new_distance;
                        queue.push({new_distance, next});
                    }
                }
            }
            visited[vertex] = 1;
        }
        return distances[to];
    }

    double symplex(double *A, int vert, int from, int to)
    {
        double distances[vert];
        int i, j;
        bool visited[vert];

        for(i = 0; i < vert; i++){
            distances[i] = MAX_DOUBLE;
            visited[i] = false;
        }
    }
};

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    srand(time(0));
    Graph obj;
    double *A, *B, result;
    bool running = true;
    int vert = 5, edges = 8, i, j, indices[] = {0, 1, 0, 3, 1, 3, 1, 4, 2, 3, 3, 0, 3, 1, 4, 1}, task_choice, choice_from, choice_to, algorithm_choice;
    string cities[] = {"Душанбе", "Хорог", "Худжанд", "Пенджикент", "Куляб", "Ура-Тюбе", "Нурек", "Гиссар", "Исфара", "Вахдат", "Истиклол", "Сарбанд", "Рогун", "Курган-Тюбе", "Канибадам", "Турсунзаде", "Кайраккум", "Бустон", "Мургаб"},
    districts[] = {"Айни", "Сино", "Сомони", "Фирдавси", "Шохмансур"};

    while (running){
        cout << "1. Задача про районы\n"
        << "2. Задача про города\n"
        << "3. Завершить программу\n"
        << "Введите номер задачи: ";
        cin >> task_choice;
        switch (task_choice)
        {
        case 1:
            cout << "\nВ городе 5 районов и 8 дорог между ними.\n"
            << "Веса графа будут заполнены в случайном порядке в пределах от 1 до 20\n\n";
            vert = 5, edges = 8;

            if (!(A = (double *)malloc(vert * vert * sizeof(double))))
            {
                cout << "Ошибка выделения памяти!\n";
                return -1;
            }

            for (i = 0; i < vert * vert; i++)
                A[i] = MAX_DOUBLE;

            for (i = 0; i < sizeof(indices) / sizeof(indices[0]); i += 2)
                A[indices[i] * vert + indices[i + 1]] = 1 + static_cast<double>(rand()) / (static_cast<double>(RAND_MAX / 19));

            obj.district_matrix(A, vert, districts);
            cout << "\nГде вы находитесь?";

            for (i = 0; i < vert; i++)
                cout << '\n' << i + 1 << ". " << districts[i];

            cout << "\nВведите номер района: ";
            cin >> choice_from;
            cout << "Введите конечный район: ";
            cin >> choice_to;
            break;

        case 2:
            cout << "Введите размер матрицы (2 - 19): ";
            cin >> vert;
            while (vert < 2 || vert > 19){
                cout << "Вы ввели недопустимое число! Пожалуйста, введите ещё раз: ";
                cin >> vert;
            }

            edges = vert * (vert + 1) / 2;

            if (!(A = (double *)malloc(vert * vert * sizeof(double))))
            {
                cout << "Ошибка выделения памяти!\n";
                return -1;
            }

            for (i = 0; i < vert; i++)
                for (j = 0; j <= i; j++){
                    if (j == i)
                        A[i * vert + j] = MAX_DOUBLE;
                    else
                        A[i * vert + j] = 1 + static_cast<double>(rand()) / (static_cast<double>(RAND_MAX / 19));
                    A[j * vert + i] = A[i * vert + j];
                }

            obj.city_matrix(A, vert, cities);
            cout << "\nВ каком вы городе?";

            for (i = 0; i < vert; i++)
                cout << '\n' << i + 1 << ". " << cities[i];

            cout << "\nВведите номер города: ";
            cin >> choice_from;
            cout << "Введите конечный город: ";
            cin >> choice_to;
            break;

        case 3:
            cout << "Программа завершена...";
            exit(0);

        default:
            cout << "Некорректный ввод. Поробуйте ещё раз.\n";
        }

        cout << "\nВыберите алгоритм:\n"
        << "1. Алгоритм Дейкстри\n"
        //<< "2. Симплекс-Метод\n"
        << "Введите номер алгоритма: ";
        cin >> algorithm_choice;

        switch (algorithm_choice)
        {
        case 1:
            result = obj.Dejxtri(A, vert, choice_from - 1, choice_to - 1);
            if (result == MAX_DOUBLE)
                cout << "\nТуда попасть невозможно.\n\n";
            else
                cout << "\nКратчайший путь будет: " << result << "\n\n";
            free(A);
            break;
        }
    }

    for (i = 0; i < sizeof(indices) / sizeof(indices[0]); i += 2)
    {
        A[indices[i] * vert + indices[i + 1]] = 1;
    }

    for (i = 0; i < vert * vert; i++)
    {
        if (A[i] == 1)
            A[i] = rand() % 10;
        else
            A[i] = MAX_DOUBLE;
    }

    if (!(B = (double *)calloc(vert * vert, sizeof(double))))
    {
        cout << "Ошибка выделения памяти";
        return -7;
    }

    for (i = 0; i < vert * vert; i++)
    {
        cin >> B[i];
    }

    obj.district_matrix(A, vert, districts);

    result = obj.Dejxtri(A, vert, 2, 4);
    cout << result;
}
