#include <stdio.h>
int main(int argc, char const *argv[])
{
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int temp = num;
    int sum = 0;
    while (temp != 0)
    {
        sum += (temp % 10);
        temp /= 10;
    }
    printf("sum of number %d is %d\n", num, sum);
    return 0;
}
