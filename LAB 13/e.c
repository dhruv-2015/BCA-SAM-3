// Write a program to display n elements and sum of those elements using dynamic memory allocation.Also release the memory occupied after displaying.
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    int sum = 0, n;
    printf("Enter n: ");
    scanf("%d", &n);
    int *ptr;
    ptr = (int *)malloc(n * sizeof(int));

    int n2;
    printf("Enter new length: ");
    scanf("%d", &n2);
    
    // ptr = (int *)malloc(n * sizeof(int));
    n = n2 + n;
    for (int i = 0; i < n; i++)
    {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", ptr);
        ptr++;
    }

    for (int i = 0; i < n; i++)
        ptr--;

    for (int i = 0; i < n; i++)
    {
        sum += *(ptr);
        printf("%d's element is: %d\n", i + 1, *(ptr));
        ptr++;
    }
    printf("Sum is: %d\n", sum);
    free(ptr);
    return 0;
}
