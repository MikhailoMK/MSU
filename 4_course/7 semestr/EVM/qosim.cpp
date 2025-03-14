#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <iomanip>

void cubic_interpolation_bessel(const std::string& input_file, const std::string& output_file) {
    std::ifstream infile(input_file);
    std::ofstream outfile(output_file);

    if (!infile.is_open() || !outfile.is_open()) {
        std::cerr << "Не удалось открыть файл." << std::endl;
        return;
    }

    std::vector<double> x, y;
    double temp_x;

    while (infile >> temp_x) {
        x.push_back(temp_x);
        y.push_back(2 * sin(temp_x / 2) + cos(temp_x * 2) / 2); // ТУТ МЕНЯТЬ ФУНКЦИЮ
    }

    int n = x.size();

    if (n < 2) {
        std::cerr << "Недостаточно данных для интерполяции." << std::endl;
        return;
    }

    std::vector<double> h(n - 1), alpha(n - 1);
    for (int i = 0; i < n - 1; ++i) {
        h[i] = x[i + 1] - x[i];
        alpha[i] = (3.0 / h[i]) * (y[i + 1] - y[i]) - (3.0 / h[i - 1]) * (y[i] - y[i - 1]);
    }

    std::vector<double> l(n), mu(n), z(n);
    l[0] = 1.0;
    mu[0] = 0.0;
    z[0] = 0.0;

    for (int i = 1; i < n - 1; ++i) {
        l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
        mu[i] = h[i] / l[i];
        z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
    }

    l[n - 1] = 1.0;
    z[n - 1] = 0.0;
    std::vector<double> c(n), b(n), d(n);
    c[n - 1] = 0.0;

    for (int i = n - 2; i >= 0; --i) {
        c[i] = z[i] - mu[i] * c[i + 1];
        b[i] = (y[i + 1] - y[i]) / h[i] - h[i] * (c[i + 1] + 2 * c[i]) / 3.0;
        d[i] = (c[i + 1] - c[i]) / (3.0 * h[i]);
    }

    outfile << std::fixed << std::setprecision(6);

    for (double xi = x.front(); xi <= x.back(); xi += 0.1) {
        int i = 0;
        while (xi > x[i + 1] && i < n - 2) {
            ++i;
        }

        double dx = xi - x[i];
        double approx_value = y[i] + b[i] * dx + c[i] * dx * dx + d[i] * dx * dx * dx;

        outfile << xi << " " << approx_value << std::endl;
    }

    infile.close();
    outfile.close();
}

int main() {
    std::string input_file = "input.txt";
    std::string output_file = "output.txt";

    cubic_interpolation_bessel(input_file, output_file);

    return 0;
}
