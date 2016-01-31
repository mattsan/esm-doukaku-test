#include <stdio.h>
#include <string.h>
#include "solver.h"

#define STRING_LENGTH 128

void test(const char input[], const char expected[], FILE *fp) {
    char actual[STRING_LENGTH];
    solve(input, actual);
    if(strcmp(actual, expected) == 0) {
        fprintf(fp, ".");
    } else {
        fprintf(
            fp,
            "\n"
            "input:    %s\n"
            "expected: %s\n"
            "actual:   %s\n",
            input,
            expected,
            actual
        );
    }
}

int main(int argc, char *argv[]) {
    char line[STRING_LENGTH];
    FILE *fp = fopen(argv[1], "r");

    while(fgets(line, sizeof(line), fp)) {
        char *p = strchr(line, '\n');
        *p = '\0';
        p = strchr(line, ' ');
        *p++ = '\0';
        test(line, p, stdout);
    }
    printf("\n");

    return 0;
}
