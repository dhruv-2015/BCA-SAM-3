#include <stdio.h>
int checkPrime(int num);
int main(int argc, char const *argv[])
{
    int num1, num2;
    printf("Enter number1: ");
    scanf("%d", &num1);
    printf("Enter number2: ");
    scanf("%d", &num2);

    for(int i = num1; i <= num2; i++) {
        int check = checkPrime(i);
        if(check == 1) {
            printf("%d ", i);
        }
    }
    printf("\n");
    return 0;
}

int checkPrime(int num) {
    for(int i = 2; i <= (num/2); i++) {
        if(num % i == 0) return 0;
    }
    return 1;
}