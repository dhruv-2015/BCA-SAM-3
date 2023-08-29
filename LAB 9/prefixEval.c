#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
int checkNum(char op);
char push(char val);
char pop();
int top = -1;
char stack[100];

int main(int argc, char const *argv[]) {
    int stackTop = -1;
    char inf[100];
    printf("Enter Prefix Expression: ");
    gets(inf);
    int i = 0;

    // printf("Ans: ");
    printf("%s = ", inf);
    while (inf[i] != '\0') {
        inf[i];
        if (inf[i] == ' ') {
            continue;
        }
        if (checkNum(inf[i]) == 1) {
            push(inf[i] - 48);
        }
        else {
            int nn2 = pop();
            int nn1 = pop();
            if (inf[i] == '+') {
                push(nn1 + nn2);
            } else if (inf[i] == '-') {
                push(nn1 - nn2);
            } else if (inf[i] == '*') {
                push(nn1 * nn2);
            } else if (inf[i] == '/') {
                push(nn1 / nn2);
            }
        }
        i++;
    }
    printf("%d", pop());
    return 0;
}

int checkNum(char op) {
    switch (op)
    {
    case '+':
    case '-':
    case '*':
    case '/':
    case '^':
    case '$':
        return 0;
        break;
    default:
        return 1;
        break;
    }
}

char pop() {
    top--;
    return stack[top + 1];
}

char push(char val) {
    stack[++top] = val;
    return top;
}
