#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include "solver.h"

void test(const std::string& input, const std::string& expected, std::ostream& out)
{
    std::string actual = solve(input);
    if(actual == expected)
    {
        out << '.';
    }
    else
    {
        out << "\n"
            << "input:   " << input    << "\n"
            << "expectd: " << expected << "\n"
            << "actual:  " << actual   << "\n";
    }
}

int main(int argc, char* argv[])
{
    std::ifstream data_file(argv[1]);
    std::string line;
    while(std::getline(data_file, line).good())
    {
        std::string::iterator i = std::find(std::begin(line), std::end(line), ' ');
        test(std::string(std::begin(line), i), std::string(++i, std::end(line)), std::cout);
    }
    std::cout << std::endl;

    return 0;
}
