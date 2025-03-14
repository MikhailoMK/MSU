#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <iomanip>

double sign(double x) {
    return (x > 0) - (x < 0);
}

double divided_difference(double x1, double x2, double y1, double y2) {
    return (y2 - y1) / (x2 - x1);
}

void cubic_interpolation(const std::string& input_file, const std::string& output_file) {
    std::ifstream infile(input_file);
    std::ofstream outfile(output_file);

    if (!infile.is_open() || !outfile.is_open()) {
        std::cerr << "Не удалось открыть файл." << std::endl;
        return;
    }

    std::vector<double> x, y;
    double temp_x, temp_y;
    while (infile >> temp_x >> temp_y) {
        x.push_back(temp_x);
        y.push_back(sin(temp_x) * sin(temp_x) / cos(temp_x));
    }

    int n = x.size();
    std::vector<double> h(n - 1), alpha(n - 1), l(n), mu(n), z(n);
    std::vector<double> c(n), b(n - 1), d(n - 1);

    for (int i = 0; i < n - 1; ++i) {
        h[i] = x[i + 1] - x[i];
        if (i > 0) {
            alpha[i] = (3.0 / h[i]) * (y[i + 1] - y[i]) - (3.0 / h[i - 1]) * (y[i] - y[i - 1]);
        }
    }

    l[0] = 1.0;
    mu[0] = 0.0;
    z[0] = 0.0;

    for (int i = 1; i < n - 1; ++i) {
        l[i] = 2.0 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
        mu[i] = h[i] / l[i];
        z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
    }

    l[n - 1] = 1.0;
    z[n - 1] = 0.0;
    c[n - 1] = 0.0;

    for (int j = n - 2; j >= 0; --j) {
        c[j] = z[j] - mu[j] * c[j + 1];
        b[j] = (y[j + 1] - y[j]) / h[j] - h[j] * (c[j + 1] + 2.0 * c[j]) / 3.0;
        d[j] = (c[j + 1] - c[j]) / (3.0 * h[j]);
        c[j] = c[j];
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

    cubic_interpolation(input_file, output_file);

    return 0;
}
