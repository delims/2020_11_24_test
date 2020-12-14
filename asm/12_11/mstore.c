long mult2(long,long);
void multstore(long x, long y, long *dest) {
    long t = mult2(x,y);
    long a = 0xeeeeaa11111111;
    double b = 12.23;
    int c = (int)b;
    *dest = t;
}
