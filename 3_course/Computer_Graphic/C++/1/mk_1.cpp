#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

int main() {
    ofstream file("data_a.txt");
    if (!file) {
        cout << "Не удалось открыть файл!";
        return 1;
    }

    for (double x = -10; x <= 10; x += 0.1) {
        double y = tan(x);
        file << x << " " << y << endl;
    }

    file.close();
    return 0;
}
