#include <algorithm>
#include <sstream>
#include <string>

std::string solve(const std::string& input)
{
    int  lhs;
    int  rhs;
    char plus;
    std::istringstream(input) >> lhs >> plus >> rhs;
    std::ostringstream oss;
    oss << (lhs + rhs);
    return oss.str();
}
