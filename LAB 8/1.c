#include <stdio.h>
int SIZE = 100;
int top1 = -1;
int top2 = -1;
int size;

void printStack(int stack[], int size, int stackint);
int push(int stack[], int size, int stackint);
int push2(int stack[], int size, int val, int stackint);
int pop(int stack[], int size, int stackint);
int peep(int stack[], int index, int size, int stackint);
int change(int stack[], int size, int index, int val, int stackint);

int main(int argc, char const *argv[])
{
    int i, val;
    int v;
    printf("Enter Stack Size: ");
    scanf("%d", &size);
    int stack1[size]; // {12, 34, 78, 23, 90, 67}
    int stack2[size];
    char dothis = 'h';
    do
    {
        int ind;
        switch (dothis)
        {
        case 'p':
            push(stack1, size, 1);
            break;
        case 'o':
            v = pop(stack1, size, 1);
            if (v != -1) {
                printf("Element poped from stack\n");
            }

            break;
        case 'g':
            i;
            printf("Enter index from top: ");
            scanf("%d", &i);
            peep(stack1, i, size, 1);
            break;
        case 'c':
            printf("Enter new value: ");
            scanf("%d", &val);
            printf("Where you  want to change (from top): ");
            scanf("%d", &i);
            change(stack1, size, i, val, 1);
            break;
        case 's':
            printf("Enter stack number (1 or 2): ");
            scanf("%d", &ind);
            printStack(((ind == 1) ? stack1 : stack2), size, (ind == 1) ? 1 : 2);
            break;
        case 'e':
            return 0;
            break;
        case 'h':
            printf("Enter h for help\n");
            printf("Enter p to push in stack (push)\n");
            printf("Enter o to pop from stack (pop)\n");
            printf("Enter r to reverse from stack (reverse)\n");
            printf("Enter g to get specific element from stack (peep)\n");
            printf("Enter c to change specific element from stack (change)\n");
            printf("Enter s to print stack\n");
            printf("Enter e to exit\n");
            break;
        case 'r':
            printf("reverse stack\n");
            int tempval;
            for (int i = top1; i >= 0; i--)
            {
                push2(stack2, size, stack1[i], 2);
            }
            printStack(stack2, size, 2);
        default:
            printf("Check Your input\n");
            break;
        }
        printf("> ");
        scanf("%s", &dothis);
    } while (0 == 0);

    return 0;
}

void printStack(int stack[], int size, int stackint)
{
    printf("Stack: \n========================\n");
    printf("index\t|  Value\n");
    for (int i = size - 1; i >= 0; i--)
    {
        // printf("%d\t|  %d\n", i +1, stack[i]);
        if (i <= ((stackint == 1) ? top1 : top2))
        {
            printf("%d\t|  %d\n", i + 1, stack[i]);
        }
        else
        {
            printf("%d\t|  - \n", i + 1);
        }
        // printf("========================\n");
    }
    printf("========================\n");
}

int pop(int stack[], int size, int stackint)
{
    if (((stackint == 1) ? top1 : top2) < 0)
    {
        printf("Stack under flow\n");
        return -1;
    }
    // stack[(stackint == 1) ? top1 : top2] = 0;
    (stackint == 1) ? top1-- : top2--;
    // printf("Element poped from stack\n");
    return stack[(stackint == 1) ? top1 + 1 : top2 + 1];
    // return (stack[top + 1]);
}

int push(int stack[], int size, int stackint)
{
    // printf("Top: %d\n\n", top);
    if (((stackint == 1) ? top1 : top2) == size - 1)
    {
        printf("Stack over flow\n");
        return 1;
    }
    printf("Enter Value to push: ");
    int val;
    scanf("%d", &val);
    stack[(stackint == 1) ? ++top1 : ++top2] = val;
    printf("Element pushed in stack\n");
    return 0;
}

int push2(int stack[], int size, int val, int stackint)
{
    // printf("Top: %d\n\n", top);
    if (((stackint == 1) ? top1 : top2) == size - 1)
    {
        printf("Stack over flow\n");
        return 1;
    }
    // printf("Enter Value to push: ");
    stack[(stackint == 1) ? ++top1 : ++top2] = val;
    // printf("Element pushed in stack\n");
    return 0;
}

int peep(int stack[], int index, int size, int stackint)
{ // get element from stack
    if (index - size < 0)
    {
        printf("Stack UnderFlow\n");
        return 0;
    }
    printf("Element: %d\n", stack[index - size]);
    return stack[index - size];
}

int change(int stack[], int size, int index, int val, int stackint)
{ // change element from stack4
    if (size - index < 0)
    {
        printf("Stack UnderFlow\n");
        return 0;
    }
    stack[size - index] = val;
    printf("Element changed to %d\n", stack[size - index]);
    return stack[size - index];
}