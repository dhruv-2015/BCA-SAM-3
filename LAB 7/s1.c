#include<stdio.h>

void printStack(int stack[], int size);
int push(int stack[], int size);
int pop(int stack[], int size);
int peep(int stack[], int index, int size);
int change(int stack[], int size, int index, int val);

int size;
int top = -1;

int main() {
    int i, val;
    printf("Enter Stack Size: ");
    scanf("%d", &size);
    int stack[size];
    for (int i = 0; i < size; i++)
        stack[i] = 0;
    char dothis = 'h';
    do {
        switch (dothis) {
        case 'p':
            push(stack, size);
            break;
        case 'o':
            pop(stack, size);
            break;
        case 'g':
            i;
            printf("Enter index from top: ");
            scanf("%d", &i);
            peep(stack, i, size);
            break;
        case 'c':
            printf("Enter new value: ");
            scanf("%d", &val);
            printf("Where you  want to change (from top): ");
            scanf("%d", &i);
            change(stack, size, i, val);
            break;
        case 's':
            printStack(stack, size);
            break;
        case 'e':
            return 0;
            break;
        case 'h':
            printf("Enter h for help\n");
            printf("Enter p to push in stack (push)\n");
            printf("Enter o to pop from stack (pop)\n");
            printf("Enter g to get specific element from stack (peep)\n");
            printf("Enter c to change specific element from stack (change)\n");
            printf("Enter s to print stack\n");
            printf("Enter e to exit\n");
            break;
        default:
            printf("Check Your input\n");
            break;
        }
        printf("> ");
        scanf("%s", &dothis);
    } while (0 == 0);
    
}

void printStack(int stack[], int size) {
    printf("Stack: \n========================\n");
    printf("index\t|  Value\n");
    for (int i = size - 1; i >=0 ; i--)
    {
        // printf("%d\t|  %d\n", i +1, stack[i]);
        if (i <= top){
            printf("%d\t|  %d\n", i + 1, stack[i]);
        } else {
            printf("%d\t|  - \n", i + 1);
        }
        // printf("========================\n");
    }
    printf("========================\n");
}

int pop(int stack[], int size) {
    if (top < 0) {
        printf("Stack under flow\n");
        return 1;
    }
    stack[top] = 0;
    top--;
    printf("Element poped from stack\n");
    return 0;
    // return (stack[top + 1]);
}

int push(int stack[], int size) {
    // printf("Top: %d\n\n", top);
    if (top == size - 1)
    {
        printf("Stack over flow\n");
        return 1;
    }
    printf("Enter Value to push: ");
    int val;
    scanf("%d", &val);
    stack[++top] = val;
    printf("Element pushed in stack\n");
    return 0;
}

int peep(int stack[], int index, int size) { // get element from stack
    if (index - size == 0) {
        printf("Stack UnderFlow\n");
        return 0;
    }
    printf("Element: %d\n", stack[index - size]);
    return stack[index - size];
}

int change(int stack[], int size, int index, int val) { // change element from stack4
    if (size - index < 0) {
        printf("Stack UnderFlow\n");
        return 0;
    }
    stack[size- index] = val;
    printf("Element changed to %d\n", stack[size - index]);
    return stack[size - index];
}