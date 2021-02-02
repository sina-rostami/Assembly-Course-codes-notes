#include <stdio.h>

int gcd(int a, int b);
int lcm(int a, int b);

int main()
{
    int a, b;
    scanf("%d%d", &a, &b);

    //TODO: Implement GCD in Assembly
    int gcd_val = gcd(a, b);
    //TODO: Implement LCM in Assembly
    int lcm_val = lcm(a, b);

    printf("%d\n%d", gcd_val, lcm_val);

    return 0;
}