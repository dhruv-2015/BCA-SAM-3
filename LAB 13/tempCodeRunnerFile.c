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
    // int temp* = ptr;
    for (int i = 0; i < n; i++)
    {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", ptr);
        ptr++;
    }
    int n2;
    printf("How meny new values you want to enter: ");
    scanf("%d", &n2);
    if (!(n2 < 1))
    {
        ptr = (int *)realloc(ptr, (n + n2) * sizeof(int));
        for (int i = 0; i < n; i++)
        {
            printf("n: $d", i);
            ptr++;
        }
        
    }
    
    // ptr = (int *)malloc(n * sizeof(int));
    for (int i = 0; i < n2; i++)
    {
        printf("Enter %d's element: ", i + n + 1);
        scanf("%d", ptr);
        ptr++;
    }

    for (int i = 0; i < n + n2; i++)
        ptr--;

    for (int i = 0; i < n + n2; i++)
    {
        sum += *(ptr);
        printf("%d's element is: %d\n", i + 1, *(ptr));
        ptr++;
    }
    printf("Sum is: %d\n", sum);
    free(ptr);
    return 0;
}
