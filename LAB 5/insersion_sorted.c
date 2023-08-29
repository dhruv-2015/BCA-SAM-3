#include<stdio.h>
int main(int argc, char const *argv[])
{
    int size;
    printf("Enter size: ");
    scanf("%d", &size);
    
    int array[size + 1];

    printf("Fill the array: \n");
    for (int i = 0; i < size; i++) {
        printf("Enter %d's element: ", i + 1);
        scanf("%d", &array[i]);
    }

    int val;
    printf("Enter Value: ");
    scanf("%d", &val);
    int index = size + 1;
    for (int i = 0; i < size; i++)
    {
        if (array[i] > val)
        {
            index = i;
            // printf("%d", index);
            break;
        }
    }
    printf("index: %d", index);

    for (int i = size; i > index; i--) {
        array[i] = array[i - 1];
    }
    array[index] = val;

    printf("\nNew array: ");
    for (int i = 0; i < size + 1; i++) {
        printf("%d", array[i]);
        if (i != size) {
            printf(", ");
        }
    }

    return 0;
}
