#include <stdio.h>
int main(int argc, char const *argv[])
{
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    (num & 2) ? printf("number is even\n") : printf("number is odd\n");
    return 0;
}
