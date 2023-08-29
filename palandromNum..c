#include<stdio.h>
int pal(int num, int num2, int index);

int main(int argc, char const *argv[])
{
    printf("%d", pal(101, 101, 0));
    return 0;
}

int pal(int num, int num2, int index){
    if (num2 == 0) {
        (num == index) ? 1 : 0;
    }
    index += (num2 % 10);
    num2 /= 10;

    return pal(num, num2, index);
}