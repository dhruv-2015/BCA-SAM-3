#include <stdio.h>
#include <stdlib.h>

struct Node
{
    int data;
    struct Node *next;
};

int length = 0;
struct Node *FIRST = NULL;
void display(struct Node *ptr)
{
    if (ptr == NULL)
    {
        return;
    }

    printf("%d \n", ptr->data);
    display(ptr->next);
}

void insertAtLast(int val)
{
    struct Node *newNode = (struct node *)malloc(sizeof(struct Node));
    newNode->data = val;
    newNode->next = NULL;

    if (FIRST == NULL)
    {
        FIRST = newNode;
    }
    else
    {
        struct Node *temp = FIRST;
        while (temp->next != NULL)
        {
            temp = temp->next;
        }
        temp->next = newNode;
    }
}

void insertAtFirst(int val)
{
    struct Node *newNode = (struct node *)malloc(sizeof(struct Node));
    newNode->data = val;
    newNode->next = FIRST;

    FIRST = newNode;
    // return newNode;
}

int deleteFromFirst()
{
    if (FIRST == NULL)
    {
        return -1;
    }

    struct Node *temp = FIRST;
    FIRST = temp->next;
    int data = temp->data;
    free(temp);
    return data;
}

int deleteFromLast()
{
    if (FIRST == NULL)
    {
        return -1;
    }
    struct Node *temp2;
    struct Node *temp = FIRST;
    while (temp->next != NULL)
    {
        temp2 = temp;
        temp = temp->next;
    }
    int data = temp->data;
    free(temp);
    temp2->next = NULL;
    return data;
}

int main(int argc, char const *argv[])
{
    int choice = 0;
    int val;
    while (0 == 0)
    {
        switch (choice)
        {
        case 0:
            printf("Enter 0 for help\n");
            printf("Enter 1 to add element at last\n");
            printf("Enter 2 to add element at first\n");
            printf("Enter 3 to remove element from first\n");
            printf("Enter 4 to remove element from last\n");
            printf("Enter 5 to Print all element\n");
            printf("Enter 9 to exit\n");

            break;
        case 1:
            printf("Enter Value to add: ");
            scanf("%d", &val);
            insertAtLast(val);
            break;
        case 2:
            printf("Enter Value to add: ");
            scanf("%d", &val);
            insertAtFirst(val);
            break;
        case 3:
            val = deleteFromFirst();
            if (val == -1)
            {
                printf("link list underflow\n");
            }
            else
            {
                printf("%d\n", val);
            }
            break;
        case 4:
            val = deleteFromLast();
            if (val == -1)
            {
                printf("link list underflow\n");
            }
            else
            {
                printf("%d\n", val);
            }
            break;
        case 5:
            display(FIRST);
            break;
        case 9:
            return 0;
        default:
            break;
        }
        printf("Enter choice: ");
        scanf("%d", &choice);
    }

    return 0;
}
