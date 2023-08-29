#include<stdio.h>
int main(int argc, char const *argv[]) {
    int size;
    printf("Enter size: ");
    scanf("%d", &size);
    
    int array[size + 1];

    printf("Fill the array: \n");
    for (int i = 0; i < size; i++) {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", &array[i]);
    }

    int index;
    printf("Where you want to add element: ");
    scanf("%d", &index);


    for (int i = size; i > index; i--) {
        array[i] = array[i - 1];
    }

    printf("Enter Value: ");
    scanf("%d", &array[index]);

    printf("\nNew array: ");
    for (int i = 0; i < size + 1; i++) {
        printf("%d", array[i]);
        if (i != size + 1) {
            printf(", ");
        }
    }

    return 0;
}
