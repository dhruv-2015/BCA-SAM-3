#include <stdio.h>
int GCD(int i, int j);
void main()
{
    int i, j;
    printf("Enter i: ");
    scanf("%d", &i);
    printf("Enter j: ");
    scanf("%d", &j);
    printf("GCD of %d and %d is: %d\n", i, j, GCD(i, j));
}
int GCD(int i, int j)
{
    if (i < j)
        GCD(j, i);
    if (j == 0)
        return i;
    return GCD(j, i % j);
}

