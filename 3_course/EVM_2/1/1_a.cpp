#include <iostream>
#include <cmath>
using namespace std;

int main ()
{
    int iterations = 0;
    double base = 1.0;
    double epsilon = 1.0;
    while (fabs(base + epsilon) > base) {
        epsilon /= 2.0;
        iterations++;
    }
    cout << "Degree of 2 is " << iterations << "\n"
         << "Epsilon = " << pow(2, -iterations) << endl;
}
