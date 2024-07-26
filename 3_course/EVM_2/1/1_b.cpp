#include <iostream>
#include <cmath>
#include <limits>
#include <iomanip>
using namespace std;

int main()
{
    double x = 1.0;
    while (x + 1 > x) {
        x *= 1.0000001;
    }
    x /= 1.0000001;
    while (x + 1 > x) {
        x += 1.0;
    }
    cout << fixed << setprecision(0)
              << "X - 1 = " << x - 1 << endl
              << "X = " << x << endl
              << "X + 1 = " << x + 1 << endl;
}
