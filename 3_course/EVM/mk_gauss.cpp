#include <iostream>
#include <windows.h>
#include <iomanip>
#include <ctime>
#include <math.h>
#include <limits>

using namespace std;

void print_row(double *A, double *b, int number_of_elements, int i);
void print_vector(double *b, int number_of_elements);
void print_equation(double *A, double *b, int number_of_elements);
int matrix_keyboard(double *A, int number_of_elements);
void matricx_random(double *A, int number_of_elements);
int matrix_file(double *A, int number_of_elements);
void matrix_function(double *A, int number_of_elements);
double accuracy_of_the_calculations(double *A, double *b, double *x, int number_of_elements);
int gaussian_elimination(double *A, double *b, int number_of_elements);
int gauss_column(double *A, double *b, int number_of_elements);
int gauss_row(double *A, double *b, int number_of_elements);

int main()
{
    srand(time(0));
    SetConsoleOutputCP(CP_UTF8);

    int n, result_of_gauss_function, method_of_input, i, j, choice_of_gauss;
    double *A, *b, variable_for_time, *A_temp, *b_temp;
    bool run = true;

    cout << "Введите размер матрицы: ";
    cin >> n;

    if (n <= 0 || n == 1)
    {
        cout << "Неверный размер матрицы!\n";
        return -1;
    }

    if (!(A = (double *)malloc((n + n * n) * sizeof(double))))
    {
        cout << "Ошибка выделения памяти для матрицы!\n";
        return -2;
    }

    if (!(b = (double *)malloc(n * sizeof(double))))
    {
        cout << "Ошибка выделения памяти для вектора!\n";
        return -3;
    }

    b = A + n * n;

    while (run)
    {
        cout << "Выберите метод ввода.\n"
        << "Доступные методы: \n"
        << "1. Рандом\n"
        << "2. Через клавиатуру\n"
        << "3. По функции\n"
        << "4. Через файл\n"
        << "Ваш выбор: ";
        cin >> method_of_input;
        switch (method_of_input)
        {
        case 1:
            matricx_random(A, n);
            run = false;
            break;
        case 2:
            if (matrix_keyboard(A, n))
            {
                free(A);
                return -5;
            }
            run = false;
            break;
        case 3:
            matrix_function(A, n);
            run = false;
            break;
        case 4:
            matrix_file(A, n);
            run = false;
            break;
        default:
            cout << "Неверный метод ввода! Попробуйте ещё раз.\n\n";
        }
    }

    for (i = 0; i < n; i++)
        for (b[i] = 0., j = 0; j < n; j++)
            b[i] += (j % 2 ? -1. : 1.) * A[i * n + j];

    cout << "Матрица A и вектор b: \n";
    print_equation(A, b, n);

    if (!(A_temp = (double *)malloc((n + n * n) * sizeof(double))))
    {
        cout << "Ошибка выделения памяти для A_temp!";
        return -8;
    }

    b_temp = A_temp + n * n;

    for (i = 0; i < n * n; i++)
        A_temp[i] = A[i];
    for (i = 0; i < n; i++)
        b_temp[i] = b[i];

    variable_for_time = clock();

    //Тут команды

    //СЛАУ
    //result_of_gauss_function = gaussian_elimination(A, b, n);

    //Гаусс с выбором по столбцу
    result_of_gauss_function = gauss_column(A, b, n);

    variable_for_time = clock() - variable_for_time;

    if (result_of_gauss_function < 0)
    {
        cout << "Ошибка! Матрица несовместна.";
        free(A);
        return -7;
    }

    cout << "Вектор х:\n";
    print_vector(b, n);

    cout << "Время работы программы: " << setw(6) << setprecision(5) << variable_for_time / CLOCKS_PER_SEC << '\n';
    cout << scientific << setprecision(6) << "Норма ||Ax - b|| = " << accuracy_of_the_calculations(A_temp, b_temp, b, n) << '\n';

    free(A);
    return 0;
}

void print_row(double *A, double *b, int num_of_el, int i)
{
    if (num_of_el >= 15)
    {
        cout << fixed;
        for (int j = 0; j < 5; j++)
            cout << setw(8) << setprecision(3) << A[i * num_of_el + j];
        cout << setw(8) << "..." << setw(8) << setprecision(3) << A[i * num_of_el + num_of_el] << " | " << setprecision(2) << b[i] << '\n';
    }
    else
    {
        for (int j = 0; j < num_of_el; j++)
            cout << setw(8) << setprecision(3) << A[i * num_of_el + j];
        cout << " | " << setprecision(3) << b[i] << '\n';
    }
}

void print_vector(double *b, int num_of_el)
{
    if (num_of_el >= 15)
    {
        cout << fixed;
        for (int j = 0; j < 5; j++)
            cout << setw(8) << setprecision(3) << b[j] << '\n';
        cout << '\n' << setw(8) << "..." << "\n\n" << setw(8) << setprecision(3) << b[num_of_el - 1] << '\n';
    }
    else
    {
        for (int j = 0; j < num_of_el; j++)
            cout << setw(8) << setprecision(3) << b[j] << '\n';
        cout << '\n';
    }
}

void print_equation(double *A, double *b, int num_of_el)
{
    if (num_of_el >= 15)
    {
        for (int i = 0; i < 5; i++)
            print_row(A, b, num_of_el, i);
        cout << '\n';
        for (int i = 0; i < 7; i++)
            cout << setw(8) << "...";
        cout << setw(6) << "..." << '\n'<< '\n';
        print_row(A, b, num_of_el, num_of_el - 1);
        cout << '\n';
    }
    else
        for (int i = 0; i < num_of_el; i++)
            print_row(A, b, num_of_el, i);
    cout << '\n';
}

void matricx_random(double *A, int num_of_el)
{
    int i;
    for (i = 0; i < num_of_el * num_of_el; i++)
    {
        A[i] = double(rand() % 10000) / double(1000);
    }
}

int matrix_keyboard(double *A, int num_of_el)
{
    int i;
    cout << "Необходимое количество элементов: " << num_of_el * num_of_el << '\n';
    for (i = 0; i < num_of_el * num_of_el; i++)
    {
        cin >> A[i];
        if (cin.fail())
        {
            cout << "Неверный ввод!\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            return -1;
        }
    }
    return 0;
}

double accuracy_of_the_calculations(double *A, double *b, double *x, int num_of_el)
{
    double sum = 0., norma = 0.;
    int i, j;
    for (i = 0; i < num_of_el; i++)
    {
        for (sum = 0., j = 0; j < num_of_el; j++)
            sum += A[i * num_of_el + j] * x[j];
        sum -= b[i];
        norma += sum * sum;
    }
    return sqrt(norma);
}

int gaussian_elimination(double *A, double *b, int num_of_el)
{

    int i, j, k;
    double temp;
    for (int i = 0; i < num_of_el; i++)
    {
        if (fabs(A[i * num_of_el + i]) < 1.e-20)
            return -(i + 1);

        temp = 1. / A[i * num_of_el + i];
        for (j = i; j < num_of_el; j++)
        {
            A[i * num_of_el + j] *= temp;
        }
        b[i] *= temp;


        for (j = i + 1; j < num_of_el; j++)
        {
            temp = A[j * num_of_el + i];
            for (k = i; k < num_of_el; k++)
            {
                A[j * num_of_el + k] -= A[i * num_of_el + k] * temp;
            }
            b[j] -= b[i] * temp;
        }
    }


    for (i = num_of_el - 1; i >= 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            temp = A[j * num_of_el + i];
            A[j * num_of_el + i] = 0;
            b[j] -= b[i] * temp;
        }
    }
    return 0;
}

int gauss_column(double *A, double *b, int num_of_el)
{

    int i, j, k, max_row;
    double temp, max_element;
    for (i = 0; i < num_of_el; i++)
    {
        max_element = A[i * num_of_el + i];
        max_row = i;
        for (j = i + 1; j < num_of_el; j++)
        {
            if (fabs(max_element) < fabs(A[j * num_of_el + i]))
            {
                max_element = A[j * num_of_el + i];
                max_row = j;
            }
        }

        if (fabs(max_element) < 1.e-20)
            return -(i + 1);

        for (j = i; j < num_of_el; j++)
        {
            temp = A[i * num_of_el + j];
            A[i * num_of_el + j] = A[max_row * num_of_el + j];
            A[max_row * num_of_el + j] = temp;
        }

        temp = b[i];
        b[i] = b[max_row];
        b[max_row] = temp;

        temp = 1. / A[i * num_of_el + i];

        for (j = i; j < num_of_el; j++)
        {
            A[i * num_of_el + j] *= temp;
        }
        b[i] *= temp;

        for (j = i + 1; j < num_of_el; j++)
        {
            temp = A[j * num_of_el + i];
            for (k = i; k < num_of_el; k++)
            {
                A[j * num_of_el + k] -= temp * A[i * num_of_el + k];
            }
            b[j] -= b[i] * temp;
        }
    }


    for (i = num_of_el - 1; i >= 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            temp = A[j * num_of_el + i];
            A[j * num_of_el + i] = 0;
            b[j] -= b[i] * temp;
        }
    }
    return 0;
}

int gauss_row(double *A, double *b, int num_of_el)
{

    int i, j, k, max_column;
    double temp, max_element;
    for (i = 0; i < num_of_el; i++)
    {
        max_element = A[i * num_of_el + i];
        max_column = i;
        for (j = i + 1; j < num_of_el; j++)
        {
            if (fabs(max_element) < fabs(A[i * num_of_el + j]))
            {
                max_element = A[i * num_of_el + j];
                max_column = j;
            }
        }

        if (fabs(max_element) < 1.e-20)
            return -(i + 1);

        for (j = i; j < num_of_el; j++)
        {
            temp = A[j * num_of_el + i];
            A[j * num_of_el + i] = A[j * num_of_el + max_column];
            A[j * num_of_el + max_column] = temp;
        }

        temp = 1. / A[i * num_of_el + i];

        for (j = i; j < num_of_el; j++)
        {
            A[i * num_of_el + j] *= temp;
        }
        b[i] *= temp;

        for (j = i + 1; j < num_of_el; j++)
        {
            temp = A[j * num_of_el + i];
            for (k = i; k < num_of_el; k++)
            {
                A[j * num_of_el + k] -= temp * A[i * num_of_el + k];
            }
            b[j] -= b[i] * temp;
        }
    }

    for (i = num_of_el - 1; i >= 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            temp = A[j * num_of_el + i];
            A[j * num_of_el + i] = 0;
            b[j] -= b[i] * temp;
        }
    }
    return 0;
}

void matrix_function(double *A, int num_of_el)
{
    int i, j;
        for (i=0; i<num_of_el; i++) {
            for (j=0; j<num_of_el; j++)
                A[i*num_of_el+j]=1./(i+j+1);
        }

}
int matrix_file(double *A, int num_of_el)
{
    int i;
    FILE *fr = fopen("data.txt", "r");
    if (!fr)
        return -1;

    for (i = 0; i < num_of_el * num_of_el; i++)
        if (!(fscanf(fr, "%lf", A+i)==1)) {
            cout<<"Неверные данные в файле!"<<endl;
            fclose(fr);
            return -1;
        }
    fclose(fr);
    return 0;
}
