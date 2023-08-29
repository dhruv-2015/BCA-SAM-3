#include<stdio.h>

int main(int argc, char const *argv[])
{
    int size;
    printf("Enter size: ");
    scanf("%d", &size);

    int array[size];
    printf("Fill the array: \n");
    for (int i = 0; i < size; i++)
    {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", &array[i]);
    }

    for (int i = 0; i < size; i++) {
        for (int j = i; j < size; j++) {
            if (array[i] > array[j]) {
                int temp = array[j];
                array[j] = array[i];
                array[i] = temp;
            }
        }
    }

    printf("\nNew array: ");
    for (int i = 0; i < size; i++) {
        printf("%d", array[i]);
        if (i != size -1) {
            printf(", ");
        }
    }

    return 0;
}
