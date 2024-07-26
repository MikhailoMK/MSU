#include <iostream>
#include <fstream>
#include <cmath>
#include <string>
using namespace std;

int main() {
    for (int i = 0; i < 100; ++i) {
        ofstream file("data_" + to_string(i) + ".txt");
        if (!file) {
            cout << "Не удалось открыть файл!";
            return 1;
        }

        for (double x = -10; x <= 10; x += 0.1) {
            double y = sin(x + i * 0.1) * cos(y + i * 0.1);
            file << x << " " << y << endl;
        }
        file.close();
    }
    return 0;
}
