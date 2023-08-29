#include <stdio.h>
int gcd(int i, int j, int index, int ans);
int main(int argc, char const *argv[]) {
    int i, j;
    printf("Enter i: ");
    scanf("%d", &i);
    printf("Enter j: ");
    scanf("%d", &j);
    printf("GCD of %d and %d is: %d\n", i, j, gcd(i, j, 0, 1));
    return 0;
}

int gcd(int i, int j, int ans, int index) {
    if (index <= i && index <= j) {
        if (i % index == 0 && j % index == 0)
            return gcd(i, j, index, index + 1);
        else
            return gcd(i, j, ans, index + 1);
    } else return ans;
}