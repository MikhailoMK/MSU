#include <iostream>
#include <cmath>
#include <limits>
#include <iomanip>
using namespace std;

int main()
{
    long double y = 1.0;
    long double h = pow(10, 20);
    long double k = 2.0;
    while (k > 1.01) {
        if (k * y + h > k * y) {
            y *= k;
        } else {
            k -= 0.01;
        }
    }
    cout << "Minimum y where y*k + h > y*k is " << y << endl;
}
