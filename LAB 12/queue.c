#include<stdio.h>
void enqueue(int val);
int dequeue();
void display();
#define SIZE 5

    int queue[SIZE];
int r = -1, f = -1;
int val;

int main(int argc, char const *argv[])
{
    char ch = 'h';

    while (0 == 0)
    {
        switch (ch)
        {
        case 'h':
            printf("Enter h for help\n");
            printf("Enter a to add element into queue\n");
            printf("Enter r to remove element from queue\n");
            printf("Enter d to display queue\n");
            printf("Enter e to exit\n");
            printf("\n");
            break;
        case 'a':
            printf("Enter value: ");
            scanf("%d", &val);
            enqueue(val);
            break;
        case 'r':
            val = dequeue();
            if (val != -1)
            {
                printf("%d\n", val);
            }
            break;
        case 'd':
            display();
            break;
        case 'e':
            return 0;
        default:
            printf("Please enter valid choice: \n");
            break;
        }
        printf("Enter choice: ");
        scanf("%s", &ch);
    }
    
    return 0;
}

void enqueue(int val) {
    (r == SIZE - 1) ? r = 0 : r++;
    if (r == f)  {
        (r == 0) ? r = SIZE - 1 : r--;
        printf("Queue overflow\n");
        return;   
    }
    queue[r] = val;
    if (f == -1) {
        f = 0;
    }
}

int dequeue() {
    
    if (f == -1) {
        printf("Queue underflow\n");
        return -1;
    }
    int temp = queue[f];
    (f == r) ? f = r = -1 : f++;

    return temp;
}

void display() {
    // printf("r: %d, f: %d\n", r, f);
    printf("queue sixe: %d \n=========\n", SIZE);
    if (f > r) {
        for (int i = f; i < SIZE; i++) {
            printf("  %d\n", queue[i], i);
            printf("=========\n");
        }
        for (int i = 0; i <= r; i++) {
            printf("  %d\n", queue[i], i);
            printf("=========\n");
        }
    } else {
        int i = f;
        for (i = f; i <= r; (i == SIZE) ? i = 0 : i++) {
            printf("  %d\n", queue[i], i);
            printf("=========\n");
        }
    }
}