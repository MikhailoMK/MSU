#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

int main() {
    ofstream file("data_b.txt");
    if (!file) {
        cout << "Не удалось открыть файл!";
        return 1;
    }

    for (double x = -10; x <= 10; x += 0.1) {
        for (double y = -10; y <= 10; y += 0.1) {
            double z = cos(x * y);
            file << x << " " << y << " " << z << endl;
        }
    }

    file.close();
    return 0;
}
