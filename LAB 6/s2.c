#include<stdio.h>

int main(int argc, char const *argv[])
{
    int size = 3;
    
    int matrix[size][size];
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("Enter %d, %d's element: ", i + 1, j +1);
            scanf("%d", &matrix[i][j]);
        }
    }

    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }

    
    return 0;
}
