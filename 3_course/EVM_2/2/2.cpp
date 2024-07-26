#include <bits/stdc++.h>
using namespace std;

long double int_1(int n)
{
    if(n == 0) return log(1.0 * 7 / 6);
    else return 1.0 / n - 6 * int_1(n - 1);
}

double int_2(int n)
{
    if(n == 62) return 0;
    else return 1. / (6 * n) - int_2(n + 1) / 6;
}

double f(double x, int n)
{
    return pow(x, n) / (x + 6);
}

double int_3(int n)
{
    double integral = 0;
    int N = 1000;
    for(int i = 0; i < N; i++)
    {
        integral += 1. / N * f(1. / (2 * N) + double(i) / N, n);
    }
    return integral;
}
int main()
{
    cout << "First integral: " << int_1(31) << endl;
    cout << "Second integral: " << int_2(31) << endl;
    cout << "Third integral: " << int_3(31);
}
