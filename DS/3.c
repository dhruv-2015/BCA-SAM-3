#include <stdio.h>

void main()
{
	int index;
	printf("Enter size of array: ");
	scanf("%d", &index);
	int myNumbers[index];
	int sum = 0;
	for (int i = 0; i < index; ++i)
	{
		printf("enter %d's number: ", i+1);
		scanf("%d", &myNumbers[i]);
		if (myNumbers[i] % 2 == 0)
		{
			sum += myNumbers[i];
		}
	}
	printf("sum is: %d\n", sum);
}