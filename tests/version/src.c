#include <string.h>
#include "config.h"

int main(int argc, char** argv) {
    if(strcmp(VERSION_VERSION, "1.2.3") != 0) return 1;
    return 0;
}
