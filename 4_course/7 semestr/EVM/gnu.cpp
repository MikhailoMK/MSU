#include <iostream>
#include <cmath>
#include <fstream>
#include <string>
using namespace std;

double F(double x, double y, double t)
{
    return exp(-0.1 * (x * x + y * y)) * sin(sqrt(x * x + y * y) + t) + cos(x * y + t) * cos(0.5 * t) / (1 + 0.05 * (x * x + y * y)) + 0.5 * sin(2 * (x - y));
}

int main()
{
    for (int frame = 0; frame <= 30; ++frame) // вот тут сделай поменьше если хочешь чтобы было быстрее, гифка долго создаётся
    {
        double t = frame * 0.1; // Параметр времени
        ofstream out("output" + to_string(frame) + ".txt");
        if (!out.is_open())
        {
            cerr << "Error opening file!" << endl;
            return 1;
        }

        for (double x = -4; x <= 4; x += 0.1)
        {
            for (double y = -4; y <= 4; y += 0.1)
            {
                out << x << " " << y << " " << F(x, y, t) << endl;
            }
            out << endl; // Разделение данных для gnuplot
        }

        out.close();
        cout << "Frame " << frame << " saved to output" << frame << ".txt" << endl;
    }

    cout << "All frames saved!" << endl;
    return 0;
}
