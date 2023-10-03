#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    int n;
    printf("Enter N: ");
    scanf("%d", &n);
    int *ptr;
    int arr[n];
    ptr = arr;
    for (int i = 0; i < n; i++)
    {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", &arr[i]);
    }
    for (int i = 0; i < n; i++)
    {
        printf("%d's element is: %d\n", i + 1, *(ptr));
        ptr++;
    }

    return 0;
}
