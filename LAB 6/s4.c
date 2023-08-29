#include<stdio.h>

int main(int argc, char const *argv[])
{
    int size;
    printf("Enter size: ");
    scanf("%d", &size);

    int matrix1[size][size];
    int matrix2[size][size];
    int matrix_sum[size][size];
    printf("Enter frist matrix: \n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("Enter %d, %d's element: ", i + 1, j +1);
            scanf("%d", &matrix1[i][j]);
        }
    }

    printf("Enter second matrix: \n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("Enter %d, %d's element: ", i + 1, j +1);
            scanf("%d", &matrix2[i][j]);
        }
    }    
    // r, c, c
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            matrix_sum[i][j] = 0;
            for (int k = 0; k < size; k++) {
                matrix_sum[i][j] += (matrix1[i][k] * matrix2[k][j]);
            }
        }
    }






    printf("Sum of matrix: \n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("%d\t", matrix_sum[i][j]);
        }
        printf("\n");
    }
    return 0;
}
