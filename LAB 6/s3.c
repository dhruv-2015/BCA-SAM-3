#include<stdio.h>

int main(int argc, char const *argv[])
{
    int size1, size2;
    printf("Enter M: ");
    scanf("%d", &size1);
    printf("Enter N: ");
    scanf("%d", &size2);

    int matrix1[size1][size2];
    int matrix2[size1][size2];
    int matrix_sum[size1][size2];
    printf("Enter frist matrix: \n");
    for (int i = 0; i < size1; i++) {
        for (int j = 0; j < size2; j++) {
            printf("Enter %d, %d's element: ", i + 1, j +1);
            scanf("%d", &matrix1[i][j]);
            matrix_sum[i][j] = matrix1[i][j];
        }
    }

    printf("Enter second matrix: \n");
    for (int i = 0; i < size1; i++) {
        for (int j = 0; j < size2; j++) {
            printf("Enter %d, %d's element: ", i + 1, j +1);
            scanf("%d", &matrix2[i][j]);
            matrix_sum[i][j] += matrix2[i][j];
        }
    }

    printf("Sum of matrix: \n");
    for (int i = 0; i < size1; i++) {
        for (int j = 0; j < size2; j++) {
            printf("%d\t", matrix_sum[i][j]);
        }
        printf("\n");
    }
    return 0;
}
