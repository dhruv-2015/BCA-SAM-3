// 
// 
// simple queue
// 
// 
// 

#include <stdio.h>
void qinsert(int val);
int qremove();
void display();
#define size 5
int queue[size];
int end = -1, start = -1;
int val;

int main(int argc, char const *argv[])
{
    char c = 'h';
    while (0 != 1) {
        switch (c) {
        case 'h':
            printf("Enter your choice:\n");
            printf("enter i in insert into queue:\n");
            printf("enter r in to remove from queue:\n");
            printf("enter h for help:\n");
            printf("enter e to exit:\n");
            break;
        case 'i':
            printf("Enter number to insert: ");
            scanf("%d", &val);
            qinsert(val);
            break;
        case 'd':
            display();
            break;
        case 'r':
            val = qremove();
            if (val != 0)
            {
                printf("%d\n", val);
            }
            break;
        case 'e':
            return 0;
        default:
            break;
        }
        printf("> ");
        scanf("%s", &c);
    }
}

void qinsert(int val)
{
    // printf("end: %d", end);
    end++;
    if (end >= size)
    {
        printf("Queue overflow\n");
        end--;
        return;
    }
    queue[end] = val;
    if (start == -1)
    {
        start = 0;
    }
}

int qremove()
{
    if (start == -1)
    {
        printf("queue underflow\n");
        return 0;
    }
    int r = queue[start];
    (start == end) ? (start = end = -1) : start++;
    return r;
}

void display(){
    printf("Queue size: %d\n", size);
    printf("------\n");
    for (int i = 0; i < size; i++)
    {
        if (i >= start && i <= end)
        {
            printf(" %d\n------\n", queue[i]);
        } else {
            printf(" - \n------\n");
        }
        
    }
    
}