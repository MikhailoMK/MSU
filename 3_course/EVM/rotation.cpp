#include <stdio.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>
#include <iostream>
#include <windows.h>

using namespace std;

#define MAX_PRINT 6
#define MAX_PRINT_VECTOR 55
#define EPS 1.e-18

void print_matrix(double *A, int n);
void print_system(double *A, double *b, int n);
void print_vector(double *b, int n);
double calc_acc(double *A, double *b, double *x, int n);
void rotation(double *A, double *b,int n);
int matrix_keyboard(double *A, int n);
int matrix_file(double *A, int n);
void matrix_function(double *A, int n);
void matrix_random(double *A, int n);


int main()
{
    SetConsoleOutputCP(CP_UTF8);
    printf("Введите размер матрицы: ");
    int i,j,n, res;
    double *A, *b, t, *A_saved,*b_saved;
    if(!scanf("%d", &n) == 1){
        printf("Неверный размер матрицы!\n");
        return -1;
    }
    if(n <= 0){
        printf("Ошибка n<1!\n");
        return -2;
    }

    if(!(A=(double *)malloc((n*n+n)*sizeof(double)))) {
        printf("Недостаточно памяти!\n");
        return -3;
    }
    b=(A+n*n);
    printf("Выберите метод ввода: 1 - Клавиатура, 2 - Файл, 3 - Функция, 4 - Рандом:");
    if (!(scanf("%d", &i)==1))
    {
        printf("Неправильный тип ввода!\n");
        free(A);
        return -5;
    }
    printf("Ваш выбор: %d\n", i);
    if (i==1)
    {
        if(matrix_keyboard (A,n))
        {
            free(A);
            return -6;
        }
    }
    else if (i==2)
    {
        if (matrix_file (A,n))
        {
            free(A);
            return -7;
        }
    }
    else if (i==3)
        matrix_function(A,n);
    else if (i==4)
        matrix_random(A,n);

    for(i = 0; i < n; i++)
        for(b[i]=0., j=0;j<n;j++)
            b[i] += (j%2?-1.:1.)*A[i*n+j];

    printf("Matrix A:\n");
    //print_matrix(A, n);
    //printf("\n");
    print_system(A, b, n);

    if(!(A_saved=(double *)malloc(2*n*n*sizeof(double)))) {
        printf("Недостаточно памяти!");
        return -3;
    }
    b_saved=A_saved+n*n;

    for (i=0; i<n*n; i++)
        A_saved[i]=A[i];

    for (i=0; i<n; i++)
        b_saved[i] = b[i];


    t = clock();
    rotation(A, b, n);
    t = clock()-t;

    if(res < 0)
    {
        printf("Ошибка! Результат %d, не делится на 0/n", res);
        free(A);
        return -4;
    }

    printf("Ответ x:\n");
    print_vector(b, n);
    printf("||Ax-b|| = %e\n",calc_acc(A_saved, b_saved, b, n));
    printf("Время алгоритма Гаусса: %.2f\n", t/CLOCKS_PER_SEC);

    free(A);
    return 0;
}

void print_matrix(double *A, int n) {
        int i,j;
        for(i =0;i<((n > MAX_PRINT)?MAX_PRINT:n);i++) {
            for(j=0;j<((n > MAX_PRINT)?MAX_PRINT:n);j++)
                printf("%.2f        ", A[i*n+j]);
            printf("\n");
        }
        return;
}

void print_system(double *A, double *b, int n) {
        int i,j;
        for(i =0;i<((n > MAX_PRINT)?MAX_PRINT:n);i++) {
            for(j=0;j<((n > MAX_PRINT)?MAX_PRINT:n);j++)
                printf("%8.2f", A[i*n+j]);
            printf("     %8.2f\n", b[i]);
        }
        return;
}

void print_vector(double *b, int n)
{
        int i;
        for(i =0;i<((n > MAX_PRINT_VECTOR)?MAX_PRINT_VECTOR:n);i++)
            printf("%8.2f", b[i]);

        printf("\n");
        return;
}

double calc_acc(double *A, double *b, double *x, int n)
{
    double sum = 0., norma = 0.;
    int i, j;
    for (i = 0; i < n; i++)
    {
        for (sum = 0., j = 0; j < n; j++)
            sum += A[i * n + j] * x[j];
        sum -= b[i];
        norma+=sum*sum;
    }
    return sqrt(norma);
}

int matrix_keyboard(double *A, int n)
{
    int i;
    printf("Введите  n*n чисел: \n");
    for (i=0; i<n*n; i++)
        if (!(scanf("%lf", A+i)==1)) {
            printf("Неверный ввод!\n");
            return -1;
        }
    return 0;
}

int matrix_file(double *A, int n)
{
    int i;
    FILE *fr=fopen("data.txt", "r");
    if (!fr)
        return -1;

    for (i=0; i<n*n; i++)
        if (!(fscanf(fr, "%lf", A+i)==1)) {
            printf("Неверная информация в файле!\n");
            fclose(fr);
            return -1;
        }
    fclose(fr);
    return 0;
}

void matrix_function(double *A, int n)
{
    int i, j;
        for (i=0; i<n; i++) {
                for (j=0; j<n; j++)
                    A[i*n+j]=1./(i+j+1);
        }
}
void matrix_random(double *A, int n)
{
    int i;
    srand(n);
    for (i=0; i<n*n; i++)
        A[i]=(rand()%2?1.:-1.)*(double)(rand()%1000) / ((rand()%1000)+1);

    return;
}

void rotation(double *A, double *b, int n) {
  double cos, sin, x, y, t;

  for (int i=0; i<n; i++) {
    for (int j=i+1; j<n; j++) {
        x = A[i*n+i];
        y = A[j*n+i];
        cos = x / sqrt(x*x+y*y);
        sin = - (y / sqrt(x*x+y*y));
        for (int k = 0; k < n; k++) {
            t = cos*A[i*n+k] - sin*A[j*n+k];
            A[j*n+k] = sin*A[i*n+k] + cos*A[j*n+k];
            A[i*n+k] = t;
        }

        t = cos*b[i] - sin*b[j];
        b[j] = sin*b[i] + cos*b[j];
        b[i] = t;
    }
  }

  for(int i = n-1; i >= 0; i--) {
    for(int j = i + 1; j < n; j++) {
        b[i] -= (A[i * n + j] * b[j]);
    }

    b[i] /= A[i*n+i];
  }
}











