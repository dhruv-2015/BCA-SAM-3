#include <stdio.h>

void main()
{
    printf("Enter number: ");
    int num;
    scanf("%d", &num);
    int fac = 1;
    for (int i = 1; i <= num; ++i)
    {
        fac *= i;
    }
    printf("Factrial of %d is %d\n", num, fac);
}

int sum(int num, int i, int sum)
{
}