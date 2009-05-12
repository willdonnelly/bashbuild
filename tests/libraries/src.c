int aFunction();
int bFunction();

int main ( int argc, char** argv ) {
    if ( aFunction () ) return 1;
    if ( bFunction () ) return 1;
    return 0;
}
