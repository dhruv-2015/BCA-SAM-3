#include<stdio.h>
void a(int num, int i);
void main()
{
	int num;
	printf("Enter number: ");
	scanf("%d", &num);
	a(num, 1);
    printf("\n");
}
void a(int num, int i){
	if(i <= num) {
		if (num % i == 0) {
			printf("%d ", i);
		}
		a(num, i+1);
	}
}