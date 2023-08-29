#include<stdio.h>
void main() {
    int size;
    printf("Enter size: ");
    scanf("%d", &size);
    
    int array[size];

    printf("Fill the array: \n");
    for (int i = 0; i < size; i++) {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", &array[i]);
    }

    int index;
    printf("Where you want to delete element: ");
    scanf("%d", &index);

    for (int i = index; i < size; i++) {
        array[i] = array[i + 1];
    }
    array[size] = 0;

    printf("\nNew array: ");
    for (int i = 0; i < size - 1; i++) {
        printf("%d", array[i]);
        if (i != size - 1) {
            printf(", ");
        }
    }
}
