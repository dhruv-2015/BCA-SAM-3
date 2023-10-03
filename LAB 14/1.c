#include <stdio.h>
#include <stdlib.h>

struct Node
{
    int data;
    struct Node *next;
};
void display(struct Node *ptr)
{
    if (ptr == NULL)
    {
        return;
    }

    printf("%d \n", ptr->data);
    display(ptr->next);
}

int main(int argc, char const *argv[])
{
    struct Node *head;
    struct Node *second;
    struct Node *thired;
    struct Node *forth;

    head = (struct node *)malloc(sizeof(struct Node));
    second = (struct node *)malloc(sizeof(struct Node));
    thired = (struct node *)malloc(sizeof(struct Node));
    forth = (struct node *)malloc(sizeof(struct Node));

    head->data = 10;
    head->next = second;

    second->data = 20;
    second->next = thired;

    thired->data = 30;
    thired->next = forth;

    forth->data = 40;
    forth->next = NULL;

    display(head);
    // for (struct Node *ptr = head; ptr != NULL; ptr = ptr->next)
    // {
    //     printf("%d \n", ptr->data);
    // }

    return 0;
}
