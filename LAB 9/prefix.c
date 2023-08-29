#include <stdio.h>
#include<ctype.h>
int precidence(char op);
char push(char val);
char pop();
int top = -1;
char stack[100];

// int main()
// {
//     int i;
//     char val[10];
//     printf("Enter Stack Size: ");
//     scanf("%d", &size);
//     char stack[size][10];
//     char dothis = 'h';
//     // do
//     // {
//     //     switch (dothis)
//     //     {
//     //     case 'p':
//     //         push(stack, size);
//     //         break;
//     //     case 'o':
//     //         pop(stack, size);
//     //         break;
//     //     case 'g':
//     //         i;
//     //         printf("Enter index from top: ");
//     //         scanf("%d", &i);
//     //         peep(stack, i, size);
//     //         break;
//     //     case 'c':
//     //         printf("Enter new value: ");
//     //         scanf("%s", &val);
//     //         printf("Where you  want to change (from top): ");
//     //         scanf("%d", &i);
//     //         change(stack, size, i, val);
//     //         break;
//     //     case 's':
//     //         printStack(stack, size);
//     //         break;
//     //     case 'e':
//     //         return 0;
//     //         break;
//     //     case 'h':
//     //         printf("Enter h for help\n");
//     //         printf("Enter p to push in stack (push)\n");
//     //         printf("Enter o to pop from stack (pop)\n");
//     //         printf("Enter g to get specific element from stack (peep)\n");
//     //         printf("Enter c to change specific element from stack (change)\n");
//     //         printf("Enter s to print stack\n");
//     //         printf("Enter e to exit\n");
//     //         break;
//     //     default:
//     //         printf("Check Your input\n");
//     //         break;
//     //     }
//     //     printf("> ");
//     //     scanf("%s", &dothis);
//     // } while (0 == 0);
// }


int main(int argc, char const *argv[])
{
    // char pos[100];
    int stackTop = -1;
    char inf[100];
    printf("Enter Expression: ");
    // scanf("%s", inf);
    gets(inf);
    int i = 0;

    printf("Ans: ");
    while (inf[i] != '\0')
    {   
        if (precidence(inf[i]) == -1)
        {
            printf("%c", inf[i]);
        }
        else if (inf[i] == '(')
        {
            push(inf[i]);
        }
        else if (inf[i] == ')')
        {
            char x = pop();
            while (x != '(')
            {
                printf("%c", x);
            }
        }
        else {
            while (precidence(stack[top]) >= precidence(inf[i]))
            {
                printf("%c", pop());
            }
            push(inf[i]);
        }
        i++;
    }
    
    while (top >= 0)
    {
        printf("%c", pop());
    }
    

    return 0;
}

int precidence(char op) {
    switch (op)
    {
    case '+':
    case '-':
        return 1;
        break;
    case '*':
    case '/':
        return 2;
        break;
    case '^':
    case '$':
        return 3;
        break;
    default:
        return -1;
        break;
    }
}


char pop()
{
    top--;
    return stack[top + 1];
}

char push(char val)
{
    stack[++top] = val;
    return top;
}
