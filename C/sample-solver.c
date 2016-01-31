#include <stdlib.h>
#include <stdio.h>

void solve(const char input[], char output[]) {
    char *p;
    long lhs;
    long rhs;
    lhs = strtol(input, &p, 10);
    rhs = strtol(++p, NULL, 10);
    sprintf(output, "%ld", lhs + rhs);
}
