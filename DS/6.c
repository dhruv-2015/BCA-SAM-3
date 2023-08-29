#include <stdio.h>
int main(int argc, char const *argv[])
{
    int num;
    printf("Enter number: ");
    scanf("%d", &num);
    int temp = num;
    int odd = 0, even = 0;
    
    while (temp != 0)
    {
        (temp %2 == 0) ? even++ : odd++;
        temp /= 10;
    }
    printf("even numbers of number %d are %d\n", num, even);
    printf("odd numbers of number %d are %d\n", num, odd);
    return 0;
}
